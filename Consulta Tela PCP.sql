 
 -- Select do Painel
 SELECT          																			
	 COUNT(*) OPABERTA,          																
	 COUNT(DISTINCT CASE WHEN LEFT(C2_NUM,1) = '0' THEN C2_NUM END) PABERTO,  				
	 COUNT(DISTINCT CASE WHEN C2_DATPRF <= GETDATE() AND LEFT(C2_NUM,1) = '0'    				
	 THEN C2_DATPRF END) ATRASADOS,          													
	 SUM(CASE WHEN C2_UM = 'RL' THEN C2_QUANT ELSE 0 END) ROLOS,          					
	 SUM(CASE WHEN C2_UM = 'M2' THEN C2_QUANT ELSE 0 END) METROQ,          					
	 SUM(CASE WHEN C2_UM = 'PC' THEN C2_QUANT ELSE 0 END) PECAS,          					
	 SUM(CASE WHEN C2_UM = 'MT' THEN C2_QUANT ELSE 0 END) METROL,          					
	 SUM(CASE WHEN B1_GRUPO IN ('PA46') THEN C2_QUANT ELSE 0 END) CORREIAS 					
	 FROM          																			
	 (SELECT          																		
	 D_E_L_E_T_,          																	
	 C2_FILIAL,          																		
	 C2_LOCAL,  																				
	 C2_NUM,  																				
	 C2_ITEM,  																				
	 C2_SEQUEN,  																				
	 C2_PRODUTO,  																			
	 C2_QUANT,  																				
	 C2_UM,  																					
	 C2_EMISSAO,  																			
	 C2_DATPRF,  																				
	 (CASE WHEN C2_SEQPAI NOT IN ('','000') THEN C2_NUM ELSE C2_PEDIDO END) C2_PEDIDO,  		
	 (CASE WHEN C2_SEQPAI NOT IN ('','000') THEN C2_ITEM ELSE C2_ITEMPV END) C2_ITEMPV  		
	 FROM  																					
	 SC2010  SC2 ) A  																						
	 INNER JOIN SB1010  SB1                                             	
	 ON B1_FILIAL = C2_FILIAL 
	 AND B1_COD = C2_PRODUTO 
	 AND B1_LOCPAD = C2_LOCAL 				
	 AND A.D_E_L_E_T_ = '' 
	 AND SB1.D_E_L_E_T_ = '' 											
	 INNER JOIN NNR010  NNR 												
	 ON NNR_FILIAL = C2_FILIAL 
	 AND NNR_CODIGO = C2_LOCAL  									
	 AND NNR.D_E_L_E_T_ = ''  																
	 LEFT OUTER JOIN SC5010  SC5                                            		
	 ON C2_FILIAL = C5_FILIAL 
	 AND C2_PEDIDO = C5_NUM 											
	 AND SC5.D_E_L_E_T_ = '' 																	
	 LEFT OUTER JOIN SA3010  SA3   													
	 ON CONCAT(RTRIM(A3_FILIAL),'01') = C5_FILIAL 
	 AND A3_COD = C5_VEND1 						
	 AND SA3.D_E_L_E_T_ = '' 																	
	 LEFT OUTER JOIN SA1010 SA1                                             	
	 ON CONCAT(RTRIM(A1_FILIAL),'01') = C5_FILIAL 											
	 AND A1_COD = C5_CLIENT 
	 AND A1_LOJA = C5_LOJACLI 											
	 AND SA1.D_E_L_E_T_ = '' 																	
	 LEFT OUTER JOIN SH6010  SH6  												
	 ON H6_FILIAL = C2_FILIAL 
	 AND H6_OP = CONCAT(C2_NUM ,C2_ITEM, C2_SEQUEN) 					
	 AND SH6.D_E_L_E_T_ = '' 																	
	 WHERE 																					
	 A.C2_FILIAL = '020101'                                   				
	 AND A.C2_EMISSAO >= '20221101'	                            				
	 AND A.C2_EMISSAO <= '20221131'		                      				
	 AND A.C2_DATPRF >= '20221101'	                  	        				
	 AND A.C2_DATPRF <= '20221131'		                      				
	 AND A.C2_LOCAL >= '01'		                       						
	 AND A.C2_LOCAL <= '99'		                    						
	 AND H6_OP IS NULL  					
	 

-- Select da primeira tabela.

 SELECT                                            										
	 (row_number() over (order by C2_DATPRF)) IND,                                            
	 CONVERT(VARCHAR(10),COnVERT(DATE,C2_DATPRF,103),103) C2_DATPRF,                          
	 COUNT(C2_NUM) 'QUANT'                                            						
	 FROM                                            											
	 (SELECT                                            										
	 D_E_L_E_T_,                                            									
	 C2_FILIAL,                                            									
	 C2_LOCAL,                                            									
	 C2_NUM,                                            										
	 C2_ITEM,                                             									
	 C2_SEQUEN,                                            									
	 C2_PRODUTO,                                            									
	 C2_QUANT,                                            									
	 C2_UM,                                            										
	 C2_EMISSAO,                                            									
	 C2_DATPRF,                                            									
	 (CASE WHEN C2_SEQPAI NOT IN ('','000') THEN C2_NUM ELSE C2_PEDIDO END) C2_PEDIDO, 		
	 (CASE WHEN C2_SEQPAI NOT IN ('','000') THEN C2_ITEM ELSE C2_ITEMPV END) C2_ITEMPV			
	 FROM 
	 SC2010  SC2) A  																						
	 INNER JOIN SB1010 SB1                                             	
	 ON B1_FILIAL = C2_FILIAL AND B1_COD = C2_PRODUTO AND B1_LOCPAD = C2_LOCAL 				
	 AND A.D_E_L_E_T_ = '' AND SB1.D_E_L_E_T_ = '' 											
	 INNER JOIN NNR010  NNR 												
	 ON NNR_FILIAL = C2_FILIAL AND NNR_CODIGO = C2_LOCAL  									
	 AND NNR.D_E_L_E_T_ = ''  																
	 LEFT OUTER JOIN  SC5010  SC5                                            		
	 ON C2_FILIAL = C5_FILIAL AND C2_PEDIDO = C5_NUM 											
	 AND SC5.D_E_L_E_T_ = '' 																	
	 LEFT OUTER JOIN  SA3010  SA3   													
	 ON CONCAT(RTRIM(A3_FILIAL),'01') = C5_FILIAL AND A3_COD = C5_VEND1 						
	 AND SA3.D_E_L_E_T_ = '' 																	
	 LEFT OUTER JOIN  SA1010  SA1                                             	
	 ON CONCAT(RTRIM(A1_FILIAL),'01') = C5_FILIAL 											
	 AND A1_COD = C5_CLIENT AND A1_LOJA = C5_LOJACLI 											
	 AND SA1.D_E_L_E_T_ = '' 																	
	 LEFT OUTER JOIN  SH6010  SH6  												
	 ON H6_FILIAL = C2_FILIAL AND H6_OP = CONCAT(C2_NUM ,C2_ITEM, C2_SEQUEN) 					
	 AND SH6.D_E_L_E_T_ = '' 																	
	 WHERE 					                                  				
	 A.C2_FILIAL = '020101'                                   				
	 AND A.C2_EMISSAO >= '20221101'	                            				
	 AND A.C2_EMISSAO <= '20221131'		                      				
	 AND A.C2_DATPRF >= '20221101'	                  	        				
	 AND A.C2_DATPRF <= '20221131'		                      				
	 AND A.C2_LOCAL >= '01'		                       						
	 AND A.C2_LOCAL <= '99'		                    						
	 AND H6_OP IS NULL  																		
	 GROUP BY A.C2_DATPRF  	


select * from SUA010 WHERE  UA_VEND = '000038' AND UA_FILIAL = '030102' AND UA_PROXLIG >= '20230123'

--BEGIN TRANSACTION

--UPDATE SUA010 SET UA_VEND = '000207' WHERE UA_OPERADO = '000103' AND UA_VEND = '000038' AND UA_FILIAL = '030102' AND UA_PROXLIG >= '20230123'

--COMMIT

--ROLLBACK


select * from SB2010 where B2_COD = '603269'

select * from SD1010 where D1_COD = '603269' order by D1_EMISSAO

select * from SD3010 where D3_COD = '000027' AND D3_EMISSAO = '20230131' order by D3_EMISSAO

select DISTINCT  * from ZRP010 where ZRP_STATE = 'PRJ' ORDER BY ZRP_NUMERO

select * from SF1010 where F1_DOC in ('000006870','000006871','000006872','000006878') and F1_FILIAL = '030102'




