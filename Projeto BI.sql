

--Possível Projeto de BI


select SUM(RA_SALARIO) from SRA010 where RA_FILIAL = '030102' and RA_DEMISSA = ''

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
		 WHERE F2_FILIAL = '030102'							  							
		 AND F2_EMISSAO >= '20231101' 							  							
		 AND F2_EMISSAO <= '20231131' 							  							
		 and D2_CF NOT IN ('6920','5901','6924','5920','6116','6949','5949','6923','5552')						  				
		 AND D2_TIPO IN ('N')  																		
		 ) F3									