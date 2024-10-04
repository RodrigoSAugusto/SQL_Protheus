
SELECT ROW_NUMBER() OVER(ORDER BY CONTA ASC) AS CONTA
	, COD_CLIENT
	, LOJA
	, CLIENTE
	, COD_VENDED
	, VENDEDOR
	, EMISSAO
	, PEDIDO
	, VALOR
	, MOTIVO
	FROM(	SELECT distinct TOP 500 C5_EMISSAO AS CONTA
					, A1_COD AS COD_CLIENT                                                                                                             
					, A1_LOJA AS LOJA                                                                                                                  
					, A1_NOME AS CLIENTE                                                                                                               
					, C5_VEND1 AS COD_VENDED                                                                                                           
					, ISNULL((SELECT RTRIM(LTRIM(A3_NOME)) FROM SA3010 (NOLOCK)                                                                        
								WHERE A3_FILIAL = SUBSTRING(C5_FILIAL,1,4)                                                                                         
								AND A3_COD = C5_VEND1                                                                                                              
								AND SA3010.D_E_L_E_T_ <> '*'),'') AS VENDEDOR                                                                                      
					, CONVERT(VARCHAR(10),CONVERT(DATE, C5_EMISSAO, 106), 103) AS EMISSAO                                                              
					, C5_NUM AS PEDIDO                                                                                                                 
					, (SELECT SUM(C6_VALOR)                                                                                                            
							FROM SC6010                                                                                                                        
							WHERE C6_FILIAL = C5_FILIAL                                                                                                        
								AND C6_NUM = C5_NUM                                                                                                                
								AND SC6010.D_E_L_E_T_='') AS VALOR                                                                                                 
					, C5_XREJEIT AS MOTIVO                                                                                                             
				    FROM SC9010                                                                                                                        
			LEFT JOIN SC5010 ON C5_FILIAL = C9_FILIAL AND C5_NUM = C9_PEDIDO AND SC5010.D_E_L_E_T_=''                                          
			LEFT JOIN SA1010 ON A1_FILIAL = SUBSTRING(C9_FILIAL,1,4) AND A1_COD = C9_CLIENTE AND A1_LOJA = C9_LOJA AND SA1010.D_E_L_E_T_=''    
				    WHERE	1=1                                                                                                                         
					AND LEFT(C9_FILIAL,4) = LEFT('010101',4)                                                                         
					AND C9_BLCRED = '09'                                                                                                               
					AND SC9010.D_E_L_E_T_=''                                                                                                           
					AND C5_EMISSAO BETWEEN '20230101' AND '20231128'
					ORDER BY C5_EMISSAO                                                         
          ) AS T1

