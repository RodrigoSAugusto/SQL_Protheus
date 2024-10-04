/* Task 77 - Mensagem de orçamento em aberto
*** Solicitação Eder e Dalva PI

Mensagem no call center, quando for Orçamento, informando que já existe orçamento em aberto para o cliente/prospect.
Mostrar o(s) número(s) do(s) orçamento(s)
Produto(s) orçados
Vendedora e Operadora do orçamento em aberto
Consultar o período de 2 meses de orçamentos em aberto

*/
USE protheus12_producao;

DECLARE @FILIAL VARCHAR(6) = '010101'
DECLARE @CLIENTE VARCHAR(6) = '055611'
DECLARE @CONTATO VARCHAR(6) = '012870'
DECLARE @DT_INI VARCHAR(8) = CONVERT(VARCHAR, (GETDATE()-30), 112)	/* Filtro por Data Inicial principal para busca de cliente						*/
DECLARE @DT_FIM VARCHAR(8) = CONVERT(VARCHAR, GETDATE(), 112);		/* Filtro por Data Final principal para busca de cliente						*/

SELECT  
		  CONCAT(IIF(A.PROSPEC='T','Prospect','Cliente')
				,' já possui orçamento aberto para o contato infromado'
		  ) AS MSG_linha_01

		, CONCAT('012870',' - ', (SELECT LTRIM(RTRIM(U5_CONTAT)) 
									FROM  SU5010 
									WHERE U5_FILIAL=SUBSTRING('010101',1,4) 
									  AND U5_CODCONT='012870' 
									  AND SU5010.D_E_L_E_T_='')
		  ) AS Contato_linha_02

		, NUM AS Num_linha_03
		, CONCAT(LTRIM(RTRIM(UB_PRODUTO)),' - ', LTRIM(RTRIM(UB_XDESNFE))) AS Produto_linha_04
		, CONCAT(UA_VEND,' - ', LTRIM(RTRIM(A3_NOME))) AS Vendedor_linha_05
		, CONCAT(UA_OPERADO,' - ', LTRIM(RTRIM(U7_NOME))) AS Operador_linha_06
	
	   FROM (SELECT 
					  UA_FILIAL AS FILIAL
					, UA_NUM AS NUM
					, UA_PROSPEC AS PROSPEC

					FROM SUA010
						WHERE	UA_FILIAL='010101'
							AND UA_OPER='2'
							AND UA_CLIENTE='055611'
							AND UA_CODCONT= '012870'
							AND UA_CANC<>'S'
							AND UA_EMISSAO BETWEEN '20231201' AND '20240225'
							AND SUA010.D_E_L_E_T_=''
			) A
  LEFT JOIN SUA010 ON UA_FILIAL=A.FILIAL AND UA_NUM=A.NUM AND UA_PROSPEC=A.PROSPEC AND SUA010.D_E_L_E_T_=''
  LEFT JOIN SUB010 ON UB_FILIAL=UA_FILIAL AND UB_NUM=UA_NUM AND SUB010.D_E_L_E_T_=''
  LEFT JOIN SA3010 ON A3_FILIAL=SUBSTRING(UA_FILIAL,1,4) AND A3_COD=UA_VEND AND SA3010.D_E_L_E_T_=''
  LEFT JOIN SU7010 ON U7_FILIAL=UA_FILIAL AND U7_COD=UA_OPERADO AND SU7010.D_E_L_E_T_=''
	WHERE	1=1
	AND UB_PRODUTO = '059718'

GROUP BY	
		  A.PROSPEC
		, A.NUM
		, UB_PRODUTO
		, UB_XDESNFE
		, UA_VEND
		, A3_NOME
		, UA_OPERADO
		, U7_NOME
		, UA_PROSPEC
ORDER BY  A.NUM

-------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------ REFATORADO PARA SE ADEQUAR AO CÓDIGO E OTIMIZAR CONSULTA----------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

	SELECT  
		  CONCAT(IIF(A.PROSPEC='T','Prospect','Cliente')
				,' já possui orçamento aberto para o contato e produto infromado '
		  ) AS MSG_linha_01

		, CONCAT('Orçamento: ', NUM, '/n') AS Num_linha_02
		, CONCAT('Vendedor: ',UA_VEND,' - ', LTRIM(RTRIM(A3_NOME))) AS Vendedor_linha_03
	
	   FROM (SELECT 
					  UA_FILIAL AS FILIAL
					, UA_NUM AS NUM
					, UA_PROSPEC AS PROSPEC

					FROM SUA010
						WHERE	UA_FILIAL='020101'
							AND UA_OPER='2'
							AND UA_CLIENTE='007624'
							--AND UA_CODCONT= '012870'
							AND UA_CANC<>'S'
							AND UA_EMISSAO BETWEEN '20231201' AND '20240225'
							AND SUA010.D_E_L_E_T_=''
			) A
  LEFT JOIN SUA010 ON UA_FILIAL=A.FILIAL AND UA_NUM=A.NUM AND UA_PROSPEC=A.PROSPEC AND SUA010.D_E_L_E_T_=''
  LEFT JOIN SUB010 ON UB_FILIAL=UA_FILIAL AND UB_NUM=UA_NUM AND SUB010.D_E_L_E_T_=''
  LEFT JOIN SA3010 ON A3_FILIAL=SUBSTRING(UA_FILIAL,1,4) AND A3_COD=UA_VEND AND SA3010.D_E_L_E_T_=''
  LEFT JOIN SU7010 ON U7_FILIAL=UA_FILIAL AND U7_COD=UA_OPERADO AND SU7010.D_E_L_E_T_=''
	WHERE	1=1
	--AND UB_PRODUTO = '059718'

GROUP BY	
		  A.PROSPEC
		, A.NUM
		, UB_PRODUTO
		, UB_XDESNFE
		, UA_VEND
		, A3_NOME
		, UA_OPERADO
		, U7_NOME
		, UA_PROSPEC
ORDER BY  A.NUM