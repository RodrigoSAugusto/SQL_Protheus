USE protheus12_producao;

SELECT CONCAT('Orçamento: ',NUM_ATENDIMENTO, '   -   Produto: ',PRODUTO) as CONSULTA
	FROM 
	(SELECT	LTRIM(RTRIM(UA_OPER))		AS OPERACAO
			, LTRIM(RTRIM(UA_NUM))		AS NUM_ATENDIMENTO
			, LTRIM(RTRIM(UA_CLIENTE))	AS CLIENTE
			, LTRIM(RTRIM(UA_LOJA))		AS LOJA
			, UA_EMISSAO				AS DT_ATENDIMENTO
			, ROW_NUMBER() OVER(
				PARTITION BY UB_PRODUTO 
					ORDER BY UA_EMISSAO 
					DESC)				AS ORDEM	-- Enumera as vezes que um produto foi inserIdo em orçamentos iniciando pelo mais recente
			, LTRIM(RTRIM(UB_PRODUTO))	AS PRODUTO
		FROM		SUA010 (NOLOCK)		-- Tabela: SUA - Orçamento Televendas
		LEFT JOIN	SUB010 (NOLOCK) ON	-- Tabela: SUB - Itens do Orçamento Televendas
						UB_FILIAL = UA_FILIAL AND UA_NUM = UB_NUM AND SUB010.D_E_L_E_T_ <> '*'
		WHERE 
			UA_FILIAL = '020101' AND	-- filtro por filial utilizado para testes, deverá ser removido posteriormente
			UA_OPER <> '3' AND -- TIPOS DE OPERAÇÃO <> 1-FATURAMENTO; 2-ORÇAMENTO; 3-ATENDIMENTO. VERIFICAR SE SERÁ NECESSÁRIO REMOVER O TIPPO = 3
			SUA010.D_E_L_E_T_ <> '*') A
		WHERE	ORDEM = 1
				AND PRODUTO IN ('033756','037074','050017','036082','033756','037074','033757')	-- Filtro de produto para teste
				AND CLIENTE = '035348'	-- Filtro de cliente para teste
				AND LOJA = '0001'		-- Filtro de loja para teste


--------------------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT PARA TRAZER AS INFORMAÇÕES DO CAMPO UA_CODOBS DA TABELA SYP010(MEMO)
--------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT ISNULL( CONVERT(VARCHAR(400), (
		SELECT DISTINCT
			REPLACE(ISNULL 
					(CONVERT
					 (VARCHAR(4000),
					  ( SELECT RTRIM(SYP.YP_TEXTO) 
						FROM SYP010 SYP	
						WHERE SYP.YP_CHAVE = (SELECT  UA_CODOBS	FROM SUA010  WHERE UA_NUM = '663575' AND UA_FILIAL = '010101')
						AND SYP.D_E_L_E_T_ = '' 
						ORDER BY YP_SEQ FOR XML PATH ('') 
					  )
					 ), ''
					),'\13\10',CHAR(13)+CHAR(10)
				   )
            FROM
                SYP010 SYP
            WHERE
                SYP.YP_CHAVE = 'AANYTF'
                AND SYP.D_E_L_E_T_ = ''
        )),
    '') AS ATIVIDADE 
		FROM SUA010  
		WHERE UA_NUM = '663575'

SELECT * FROM SUB010 WHERE UB_NUM = '700288'

--------------------------------------------------------------------------------------------------------------------------------
--SELECT USADO NO FONT GA_ATMK001.PRW
--------------------------------------------------------------------------------------------------------------------------------

SELECT CONCAT('Orçamento: ',NUM_ATENDIMENTO, '   -   Produto: ',PRODUTO, '  -  Valor: ', VALOR) as CONSULTA, *                                                            
FROM                                                                                                                                            
(SELECT	LTRIM(RTRIM(UA_OPER))		AS OPERACAO                                                                                                 
		, LTRIM(RTRIM(UA_NUM))		AS NUM_ATENDIMENTO                                                                                          
		, LTRIM(RTRIM(UA_CLIENTE))	AS CLIENTE                                                                                                  
		, LTRIM(RTRIM(UA_LOJA))		AS LOJA           
		, LTRIM(RTRIM(UB_VRUNIT))	AS VALOR
		, UA_EMISSAO				AS DT_ATENDIMENTO                                                                                           
		, ROW_NUMBER() OVER(                                                                                                                    
			PARTITION BY UB_PRODUTO                                                                                                             
				ORDER BY UA_EMISSAO                                                                                                             
				DESC)				AS ORDEM	-- Enumera as vezes que um produto foi inserIdo em orçamentos iniciando pelo mais recente       
		, LTRIM(RTRIM(UB_PRODUTO))	AS PRODUTO                                                                                                  
	FROM		SUA010 (NOLOCK)		-- Tabela: SUA - Orçamento Televendas                                                                       
	LEFT JOIN	SUB010 (NOLOCK) ON	-- Tabela: SUB - Itens do Orçamento Televendas                                                              
					UB_FILIAL = UA_FILIAL AND UA_NUM = UB_NUM AND SUB010.D_E_L_E_T_ <> '*'                                                      
	WHERE                                                                                                                                       
		UA_FILIAL = '010101' AND	-- filtro por filial  
		UA_CLIENTE = '055611' AND	-- filtro por Cliente
		UA_OPER <> '3' AND -- TIPOS DE OPERAÇÃO <> 1-FATURAMENTO; 2-ORÇAMENTO; 3-ATENDIMENTO. VERIFICAR SE SER?? NECESS??RIO REMOVER O TIPPO = 3  
		SUA010.D_E_L_E_T_ <> '*') A                                                                                                             
	WHERE	ORDEM = 1                                                                                                                           
			AND PRODUTO IN ('018755')	-- Filtro de produto para teste                                                                 
			AND CLIENTE = '055611'	-- Filtro de cliente para teste                                                                     
			AND LOJA = '0001'		-- Filtro de loja para teste      
			


