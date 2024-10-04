 
 
		SELECT 																							
		 CONVERT(VARCHAR(10), CONVERT(DATE,F2_EMISSAO,103),103) F2_EMISSAO, 								
		 CONVERT(VARCHAR, CONCAT( DIA,', Week ', WK )) SEMANA, 											
		 SUM(VALOR)  VALOR,																				
		 COUNT(F2_DOC) QTD_NOTAS 																			
		 FROM 																								
		 (SELECT DISTINCT F2_DOC, DATENAME(DW, F2_EMISSAO) DIA, F2_EMISSAO, DATEPART(WK,F2_EMISSAO) WK,	
		  F2_VALMERC+F2_FRETE VALOR 		 																
		 FROM SF2010 																						
		 INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC 									
		 AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = ''		 				
		 WHERE F2_FILIAL = '010102'							  							
		 AND F2_EMISSAO >= '20230501' 							  							
		 AND F2_EMISSAO <= '20230531' 							  							
		 and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')						  				
		 AND D2_TIPO IN ('N')  																		
		 ) F2																								
		 																									
		 GROUP BY F2_EMISSAO, DIA, WK  																	
		 																									
		 UNION ALL																							
		 																									
		 SELECT 'TOTAL', 																					
		 '-',																								
		 ROUND(SUM(VALOR),2),																				
		 COUNT(F2_DOC)																						
		 FROM 																								
		 (SELECT DISTINCT F2_DOC, F2_EMISSAO,																
		  F2_VALMERC+F2_FRETE VALOR																		
		 FROM SF2010																						
		 SF2010																							
		 INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC									
		 AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_ = '' AND SD2010.D_E_L_E_T_ = ''						
		 WHERE F2_FILIAL = '010102'							  							
		 AND F2_EMISSAO >= '20230501' 							  							
		 AND F2_EMISSAO <= '20230531' 							  							
		 and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')						  				
		 AND D2_TIPO IN ('N')  																		
		 ) F3																								
		  																									
		 UNION ALL																							
		 																									
		 SELECT MEDIA,'-', ROUND(VALOR/EMI,2), ROUND(DOC/EMI,2)   											
		 FROM ( 		 																					
		 SELECT COUNT(F2_DOC) DOC,'MEDIA DIARIA' MEDIA, sum(VALOR) VALOR, COUNT(DISTINCT F2_EMISSAO) EMI	
		 FROM (SELECT DISTINCT F2_DOC, F2_EMISSAO , 														
		 F2_VALMERC+F2_FRETE VALOR 		 																
		 FROM SF2010 																						
		 INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC		 							
		 AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = ''		  				
		 WHERE F2_FILIAL = '010102'							  							
		 AND F2_EMISSAO >= '20230501' 							  							
		 AND F2_EMISSAO <= '20230531' 							  							
		 and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')						  				
		 AND D2_TIPO IN ('N')  																		
		 ) F4 		 																						
		 ) F5 																								
		  																									
		 UNION  ALL 																						
		 																									
		 SELECT  'Média por Semana', CONVERT(VARCHAR,WK),													
		 ROUND(SUM(VALOR)/COUNT(DISTINCT DW),2), ROUND(COUNT(F2_DOC)/COUNT(DISTINCT DW),2) 				
		 FROM																								
		 (SELECT DISTINCT  F2_DOC, F2_EMISSAO , DATEPART(wk,F2_EMISSAO) WK, DATEPART(DW,F2_EMISSAO) DW,	
		 F2_VALMERC+F2_FRETE VALOR  																		
		 FROM SF2010  																						
		 INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC 									
		 AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = '' 						
		 WHERE F2_FILIAL = '010102'							  							
		 AND F2_EMISSAO >= '20230501' 							  							
		 AND F2_EMISSAO <= '20230531' 							  							
		 and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')						  				
		 AND D2_TIPO IN ('N')  																		
		 GROUP BY F2_DOC, F2_EMISSAO, F2_BASEIPI, F2_BASEICM, F2_VALMERC, F2_FRETE 						
		 ) F6 																								
		 																									
		 GROUP BY WK 																						
		 ORDER BY F2_EMISSAO 	
		 


		select D2_CF, * from SD2010 WHERE D2_FILIAL = '010102' and D_E_L_E_T_ = ''										
		AND D2_EMISSAO >= '20230516' 											
		AND D2_EMISSAO <= '20230516'

	

		select * from SF2010 WHERE F2_FILIAL = '010102' 											
		AND F2_EMISSAO >= '20230523' 											
		AND F2_EMISSAO <= '20230523'

		
		SELECT F2_DOC DOC, F2_EMISSAO, SUM(F2_VALMERC - F2_VALICM) VALOR, (F2_VALMERC + F2_FRETE) VALMERC, 
		(F2_FRETE + F2_VALMERC + F2_VALIPI) TOTAL FROM  	
		(SELECT DISTINCT F2_DOC, F2_EMISSAO , F2_VALICM,F2_VALMERC , F2_FRETE, F2_VALIPI 																				
		FROM SF2010  																			
		INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC 						
		AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = '' 			
		WHERE F2_FILIAL = '010102'				 							
		AND F2_EMISSAO >= '20230531'				 							
		AND F2_EMISSAO <= '20230531'											
		and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','5152')														
		AND D2_TIPO IN ('N')																
		)	F2																					
																								
		GROUP BY F2_EMISSAO, F2_DOC, F2_FRETE, F2_VALMERC, F2_VALIPI										
																								
		UNION  ALL																				
																								
		SELECT 'TOTAL', '', SUM(F2_VALMERC - F2_VALICM), SUM(F2_VALMERC + F2_FRETE), 
		SUM(F2_FRETE + F2_VALMERC + F2_VALIPI) FROM 			
		(SELECT DISTINCT F2_DOC, F2_EMISSAO , F2_VALICM, F2_VALMERC, F2_FRETE, F2_VALIPI  		        	    							                		
		FROM SF2010 																			
		SF2010  																				
		INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC 						
		AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = '' 			
		WHERE F2_FILIAL = '010102' 											
		AND F2_EMISSAO >= '20230531'											
		AND F2_EMISSAO <= '20230531'											
		and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','5152')														
		AND D2_TIPO IN ('N')																
		) F3 																					
	
		SELECT * FROM SF2010
		WHERE F2_FILIAL = '010102' 											
		AND F2_EMISSAO >= '20230501'											
		AND F2_EMISSAO <= '20230501'											
					



		SELECT 																							
        CONVERT(VARCHAR(10), CONVERT(DATE,F2_EMISSAO,103),103) F2_EMISSAO, 								
        CONVERT(VARCHAR, CONCAT( DIA,', Week ', WK )) SEMANA, 											    
        SUM(VALOR)  VALOR,																				    
        COUNT(F2_DOC) QTD_NOTAS 																			
        FROM 																								
        (SELECT DISTINCT F2_DOC, DATENAME(DW, F2_EMISSAO) DIA, F2_EMISSAO, DATEPART(WK,F2_EMISSAO) WK,	    
        F2_VALMERC+F2_FRETE VALOR 		 																    
        FROM SF2010 																						
        INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC 									
        AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = ''		 				
        WHERE F2_FILIAL = '010102'							  							
        AND F2_EMISSAO >= '20240701'							  							    
        AND F2_EMISSAO <= '20240710' 							  							
        and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')					
        AND D2_TIPO IN ('N')  																		        
        ) F2																								
                                                                                                           
        GROUP BY F2_EMISSAO, DIA, WK  																	    
                                                                                                           
        UNION ALL																							
                                                                                                           
        SELECT 'TOTAL', 																					
        '-',																								
        ROUND(SUM(VALOR),2),																				
        COUNT(F2_DOC)																						
        FROM 																								
        (SELECT DISTINCT F2_DOC, F2_EMISSAO,																
        F2_VALMERC+F2_FRETE VALOR																		    
        FROM SF2010																						
        SF2010																							    
        INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC									    
        AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_ = '' AND SD2010.D_E_L_E_T_ = ''						
        WHERE F2_FILIAL = '010102'							  							
        AND F2_EMISSAO >= '20240701'							  							    
        AND F2_EMISSAO <= '20240710' 							  							
        and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')					
        AND D2_TIPO IN ('N')  																		        
        ) F3																								
                                                                                                           
        UNION ALL																							
                                                                                                           
        SELECT MEDIA,'-', ROUND(VALOR/EMI,2), ROUND(DOC/EMI,2)   											
        FROM ( 		 																					
        SELECT COUNT(F2_DOC) DOC,'MEDIA DIARIA' MEDIA, sum(VALOR) VALOR, COUNT(DISTINCT F2_EMISSAO) EMI	
        FROM (SELECT DISTINCT F2_DOC, F2_EMISSAO , 														
        F2_VALMERC+F2_FRETE VALOR 		 																    
        FROM SF2010 																						
        INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC		 							    
        AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = ''		  				
        WHERE F2_FILIAL = '010102'							  							
        AND F2_EMISSAO >= '20240701' 							  							
        AND F2_EMISSAO <= '20240710' 							  							
        and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')					
        AND D2_TIPO IN ('N')  																		        
        ) F4 		 																						
        ) F5 																								
                                                                                                           
        UNION  ALL 																						
                                                                                                           
        SELECT  'Média por Semana', CONVERT(VARCHAR,WK),													
        ROUND(SUM(VALOR)/COUNT(DISTINCT DW),2), ROUND(COUNT(F2_DOC)/COUNT(DISTINCT DW),2) 				    
        FROM																								
        (SELECT DISTINCT  F2_DOC, F2_EMISSAO , DATEPART(wk,F2_EMISSAO) WK, DATEPART(DW,F2_EMISSAO) DW,	    
        F2_VALMERC+F2_FRETE VALOR  																		
        FROM SF2010  																						
        INNER JOIN SD2010 ON D2_FILIAL = F2_FILIAL AND D2_DOC = F2_DOC 									
        AND D2_SERIE = F2_SERIE AND SF2010.D_E_L_E_T_= '' AND SD2010.D_E_L_E_T_ = '' 						
        WHERE F2_FILIAL = '010102'							  							
        AND F2_EMISSAO >= '20240701' 							  							
        AND F2_EMISSAO <= '20240710' 							  							
        and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')					
        AND D2_TIPO IN ('N')  																		        
        GROUP BY F2_DOC, F2_EMISSAO, F2_BASEIPI, F2_BASEICM, F2_VALMERC, F2_FRETE 						    
        ) F6 																								
                                                                                                           
        GROUP BY WK 																						
        ORDER BY F2_EMISSAO 	    