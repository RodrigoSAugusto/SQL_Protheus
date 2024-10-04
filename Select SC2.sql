

SELECT 
  C2_EMISSAO EMISSAO
, C2_NUM NUMOP
, C2_ITEM ITEMOP
, C2_SEQUEN SEQOP
, C2_PRODUTO CODPROD
, B1_DESC DESCPROD
, ISNULL(C5_CLIENTE, '000000') CODCLI	
, ISNULL(C5_LOJACLI,'0000') LOJACLI
, ISNULL(A1_NOME,'OP INTERNA') NOME
, C2_QUANT QUANT
, C2_DATPRI PREVINI
, C2_DATPRF PREVENT
FROM SC2010 C2
INNER JOIN SB1010 B1 
ON B1_FILIAL = C2_FILIAL 
AND B1_LOCPAD = C2_LOCAL 
AND B1_COD = C2_PRODUTO  
AND B1.D_E_L_E_T_ = '' 
AND C2.D_E_L_E_T_ = ''
LEFT OUTER JOIN SC5010 C5 
ON C5_FILIAL = C2_FILIAL 
AND C5_NUM = C2_PEDIDO
AND C5.D_E_L_E_T_ = ''
LEFT OUTER JOIN SA1010 A1 
ON A1_FILIAL = LEFT(C5_FILIAL,4)
AND A1_COD = C5_CLIENTE
AND A1_LOJA = C5_LOJACLI
AND A1.D_E_L_E_T_ = '' AND A1_MSBLQL = '2'
WHERE C2_FILIAL = '020101' 
AND C2_QUJE < C2_QUANT




select * from SUA010 where UA_NUMSC5 = '093540'


  SELECT                                                       
         CONVERT(VARCHAR,CONVERT(DATE,C2_EMISSAO), 103) EMISSAO                                           
       , C2_NUM NUMOP                                                 
       , C2_ITEM ITEMOP                                               
       , C2_SEQUEN SEQOP                                              
       , C2_PRODUTO CODPROD                                           
       , B1_DESC DESCPROD                                             
       , ISNULL(C5_CLIENTE, '000000') CODCLI	                        
       , ISNULL(C5_LOJACLI,'0000') LOJACLI                            
       , ISNULL(A1_NOME,'OP INTERNA') NOME                            
       , C2_QUANT QUANT                                               
       , CONVERT(VARCHAR,CONVERT(DATE,C2_DATPRI), 103) PREVINI        
       , CONVERT(VARCHAR,CONVERT(DATE,C2_DATPRF), 103) PREVENT        
         FROM SC2010 C2                                               
         INNER JOIN SB1010 B1                                         
         ON B1_FILIAL = C2_FILIAL                                     
         AND B1_LOCPAD = C2_LOCAL                                     
         AND B1_COD = C2_PRODUTO                                      
         AND B1.D_E_L_E_T_ = ''                                       
         AND C2.D_E_L_E_T_ = ''                                       
         LEFT OUTER JOIN SC5010 C5                                    
         ON C5_FILIAL = C2_FILIAL                                     
         AND C5_NUM = C2_PEDIDO                                       
         AND C5.D_E_L_E_T_ = ''                                       
         LEFT OUTER JOIN SA1010 A1                                    
         ON A1_FILIAL = LEFT(C5_FILIAL,4)                             
         AND A1_COD = C5_CLIENTE                                      
         AND A1_LOJA = C5_LOJACLI                                     
         AND A1.D_E_L_E_T_ = '' AND A1_MSBLQL = '2'                   
         WHERE C2_FILIAL = '020101'
		 AND C2_EMISSAO >= '20230301'
		 AND C2_EMISSAO <= '20230310'
         AND C2_QUJE < C2_QUANT
		 ORDER BY EMISSAO



	SELECT 
	UA_FILIAL, 
	A1_EST, 
	A1_MUN,
	COUNT(UA_NUM) PEDIDOS,
	SUM(F2_VALFAT) 'VALOR_FATURA'
	FROM SUA010 UA 
	INNER JOIN SF2010 F2 ON 
	F2_FILIAL = UA_FILIAL 
	AND F2_DOC = UA_DOC 
	AND F2_CLIENTE = UA_CLIENTE 
	AND F2_LOJA = UA_LOJA 
	AND F2.D_E_L_E_T_ = '' 
	AND UA.D_E_L_E_T_ = ''
	INNER JOIN SA1010 A1 ON 
	A1_FILIAL = LEFT(UA_FILIAL,4)
	AND A1_COD = UA_CLIENTE 
	AND A1_LOJA = UA_LOJA 
	AND A1.D_E_L_E_T_ = ''
	WHERE 1=1
	AND UA_DOC <> '' 
	AND UA_OPER = '1' 
	AND UA_FILIAL = '010101' 
	AND UA_EMISSAO >= '20230301'
	AND UA_EMISSAO <= '20230331'
	GROUP BY UA_FILIAL, A1_EST, A1_MUN
	ORDER BY UA_FILIAL , A1_EST, A1_MUN







