SELECT                                                                
	 F2_EMISSAO,     													    
	 SUM(F2_BASEIPI) VALOR                                                 
	 FROM SF2010                                                           
	 WHERE F2_FILIAL = '020101 '                          
	 AND F2_EMISSAO >= '20220101 '                            
	 AND F2_EMISSAO <= '20220105 '                           
	 AND D_E_L_E_T_ = ''                                                   
	 GROUP BY F2_EMISSAO                                                   
	                                                                       
	 UNION ALL                                                             
	                                                                       
	 SELECT 'TOTAL', SUM(F2_BASEIPI)                                       
	 FROM SF2010                                                           
	 WHERE F2_FILIAL = '020101'                           
	 AND F2_EMISSAO >= '20220101'                            
	 AND F2_EMISSAO <= '20220105'                           
	 AND D_E_L_E_T_ = ''       
	 
	 SELECT  											          						
		CONCAT(D2_LOCAL, ' - ',NNR_DESCRI) ZOSLOCAL,  										
		CONVERT(VARCHAR(10),CONVERT(DATE,D2_EMISSAO,103),103) ZOSDATA,  					
		COUNT(DISTINCT D2_DOC) ZOSQTDDOC,  											    
		SUM(D2_VALBRUT) ZOSFATBR 	 											        	
		FROM  											          							
		SD2010 SD2
		INNER JOIN 											          					
		NNR010 NNR  											          					
		ON NNR_FILIAL = D2_FILIAL AND NNR_CODIGO = D2_LOCAL  								
		AND NNR.D_E_L_E_T_ = '' AND SD2.D_E_L_E_T_ = ''  									
	         WHERE                                                                       
	             D2_FILIAL = '020101'                                  
	             AND D2_EMISSAO >= '20211202'	                            
	             AND D2_EMISSAO <= '20211226'                        
	             AND D2_LOCAL >= '01'				                        
	             AND D2_LOCAL <= '99'				                        
		GROUP BY CONCAT(D2_LOCAL, ' - ',NNR_DESCRI),D2_EMISSAO 							
													          								
		UNION ALL 											          					
												          								
		SELECT 'TOTAL','',COUNT(DISTINCT D2_DOC),SUM(D2_VALBRUT) FROM SD2010 				
	         WHERE                                                                       
	             D2_FILIAL = '020101'                                  
	             AND D2_EMISSAO >= '20211202'	                            
	             AND D2_EMISSAO <= '20211226'	                        
	             AND D2_LOCAL >= '01'			                        
	             AND D2_LOCAL <= '99'			                        
		AND D_E_L_E_T_ = '' 				