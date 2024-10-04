 SELECT 																																						 
 	 CASE WHEN UA_FILIAL ='010101' THEN 'TEGAPE'																												 
    WHEN UA_FILIAL ='010102' THEN 'TEGAPE COLOMBO'																												 
 	 WHEN UA_FILIAL ='020101' THEN 'PROCESSO INDUSTRIAL'																										 
 	 WHEN UA_FILIAL ='030101' THEN 'TEGAPE QUIMICA'																												 
 	 WHEN UA_FILIAL ='030102' THEN 'TEGAPE QUIMICA CGS'																											 
 	 END EMPRESA,																																				 
 	 UA_FILIAL,UA_VEND,A3_NOME,																																	 
 	 (SELECT SUM(C6_VALOR)																																		 
  	 FROM SC5010 SC5 (NOLOCK)																																	 
  	 JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C6_NUM =C5_NUM AND SC5.D_E_L_E_T_='' AND SC6.D_E_L_E_T_=''												 
  	 WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'
		AND SC6.D_E_L_E_T_=''
		--amostra
				AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
				--sem amostra
				--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )TOTAL_PED,																																				 
 		(SELECT COUNT(DISTINCT C5_NUM) QTD_PED
		--SELECT * 
 	  FROM SC5010 SC5 (NOLOCK)	
  	 JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C6_NUM =C5_NUM AND SC5.D_E_L_E_T_='' AND SC6.D_E_L_E_T_=''												 
 	  WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'																					 
 	 	AND SC6.D_E_L_E_T_=''	
		--amostra
		AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
		--sem amostra
		--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )QTD_PED,		 																																		 	 
 	 (SELECT COUNT(DISTINCT C5_NUM) QTD_PED																													 	 
 	  FROM SC5010 SC5 (NOLOCK)																																	 
 		JOIN SC6010 SC6 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC6.D_E_L_E_T_=''																		 
 		JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''																	 
 	  WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'																					 
 	 	AND SC5.D_E_L_E_T_=''																																	 
 		AND SC6.C6_LOCAL ='01'	
		--amostra
		AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
		--sem amostra
		--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )FILTROS,																																					 
 	 (SELECT COUNT(DISTINCT C5_NUM) QTD_PED																														 
 	  FROM SC5010 SC5 (NOLOCK)																																	 
 		JOIN SC6010 SC6 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC6.D_E_L_E_T_=''																		 
 		JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''																	 
 	  WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'																					 
 	 	AND SC5.D_E_L_E_T_=''																																	 
 		AND SC6.C6_LOCAL ='04'		
		--amostra
		AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
		--sem amostra
		--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )ACO_METAL           ,																																		 
 	 (SELECT COUNT(DISTINCT C5_NUM) QTD_PED																														 
 	  FROM SC5010 SC5 (NOLOCK)																																	 
 		JOIN SC6010 SC6 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC6.D_E_L_E_T_=''																		 
 		JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''																	 
 	  WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'																					 
 	 	AND SC5.D_E_L_E_T_=''																																	 
 		AND SC6.C6_LOCAL ='05'	
		--amostra
		AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
		--sem amostra
		--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )GAIOLAS             ,																																		 
 	 (SELECT COUNT(DISTINCT C5_NUM) QTD_PED																														 
 	  FROM SC5010 SC5 (NOLOCK)																																	 
 		JOIN SC6010 SC6 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC6.D_E_L_E_T_=''																		 
 		JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''																	 
 	  WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'																					 
 	 	AND SC5.D_E_L_E_T_=''																																	 
 		AND SC6.C6_LOCAL ='06'	
		--amostra
		AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
		--sem amostra
		--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )ESTEIRAS            ,																																		 
 	 (SELECT COUNT(DISTINCT C5_NUM) QTD_PED																														 
 	  FROM SC5010 SC5 (NOLOCK)																																	 
 		JOIN SC6010 SC6 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC6.D_E_L_E_T_=''																		 
 		JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''																	 
 	  WHERE 1=1																																					 
 	 	AND C5_FILIAL = UA_FILIAL																																 
 	 	AND C5_VEND1=UA_VEND																																	 
 	 	AND C5_EMISSAO BETWEEN '20210101' AND '20210604'																					 
 	 	AND SC5.D_E_L_E_T_=''																																	 
 		AND SC6.C6_LOCAL ='07'		
		--amostra
		AND ( C6_CF IN ('5911','6911') OR C6_CF IS NULL )
		--sem amostra
		--AND ( C6_CF NOT IN ('5911','6911') OR C6_CF IS NULL )
 	 )TEFLON              ,																																		 
 																																								 
 	COUNT(DISTINCT TOTAL_ORC)TOTAL_ORC,	 																														 
 	COUNT(DISTINCT ORC_EMAIL)ORC_EMAIL,																															 
 	COUNT(DISTINCT ORC_TELEFONE)ORC_TELEFONE,		 																											 
 	COUNT(DISTINCT ORC_WHATSAPP)ORC_WHATSAPP, 																													 
 	COUNT(DISTINCT ORC_PORTAL)ORC_PORTAL, 																														 
 	COUNT(DISTINCT ORC_ORD_COMPRA)ORC_ORD_COMPRA, 																												 
 	COUNT(DISTINCT ORC_OUTRAS)ORC_OUTRAS, 																														 
 	COUNT(DISTINCT TOTAL_ATEND)TOTAL_ATEND,																														 
 	COUNT(DISTINCT ATEND_EMAIL)ATEND_EMAIL,																														 
 	COUNT(DISTINCT ATEND_TELEFONE)ATEND_TELEFONE,																												 
 	COUNT(DISTINCT ATEND_WHATSAPP)ATEND_WHATSAPP, 																												 
 	COUNT(DISTINCT ATEND_PORTAL)ATEND_PORTAL, 																													 
 	COUNT(DISTINCT ATEND_ORD_COMPRA)ATEND_ORD_COMPRA, 																											 
 	COUNT(DISTINCT ATEND_OUTRAS)ATEND_OUTRAS 																													 
 	FROM(																																						 
 			SELECT UA_FILIAL,UA_VEND,A3_NOME,																													 
 			CASE WHEN UA_OPER ='1' AND SC6_DELET='' THEN C6_VALOR ELSE 0 END TOTAL_PED,																		 	 
 			CASE WHEN UA_OPER ='1' THEN UA_NUM  END PEDIDOS,																									 
 			CASE WHEN UA_OPER ='2' THEN UA_NUM  END TOTAL_ORC,																									 
 			CASE WHEN UH_DESC IN('E-MAIL','EMAIL','E-mail') AND UA_OPER ='2' THEN UA_NUM  END ORC_EMAIL, 														 
 			CASE WHEN UH_DESC ='TELEFONE'  AND UA_OPER ='2' THEN UA_NUM  END ORC_TELEFONE,																		 
 			CASE WHEN UH_DESC ='WHATSAPP'  AND UA_OPER ='2' THEN UA_NUM END ORC_WHATSAPP,																		 
 			CASE WHEN UH_DESC ='PORTAL'  AND UA_OPER ='2' THEN UA_NUM END ORC_PORTAL, 																			 
 			CASE WHEN UH_DESC ='Ordem de Compra'  AND UA_OPER ='2' THEN UA_NUM END ORC_ORD_COMPRA,																 
 			CASE WHEN UH_DESC NOT IN('E-MAIL','EMAIL','E-mail','TELEFONE','WHATSAPP','PORTAL','Ordem de Compra')  AND UA_OPER ='2' THEN UA_NUM  END ORC_OUTRAS,  
 			CASE WHEN UA_OPER ='3' THEN UA_NUM END TOTAL_ATEND,																								  	 
 			CASE WHEN UH_DESC IN('E-MAIL','EMAIL','E-mail') AND UA_OPER ='3' THEN UA_NUM  END ATEND_EMAIL, 														 
 			CASE WHEN UH_DESC ='TELEFONE'  AND UA_OPER ='3' THEN UA_NUM  END ATEND_TELEFONE,																	 
 			CASE WHEN UH_DESC ='WHATSAPP'  AND UA_OPER ='3' THEN UA_NUM END ATEND_WHATSAPP,																		 
 			CASE WHEN UH_DESC ='PORTAL'  AND UA_OPER ='3' THEN UA_NUM END ATEND_PORTAL, 																		 
 			CASE WHEN UH_DESC ='Ordem de Compra'  AND UA_OPER ='3' THEN UA_NUM END ATEND_ORD_COMPRA, 															 
 			CASE WHEN UH_DESC NOT IN('MAIL','EMAIL','E-mail','TELEFONE','WHATSAPP','PORTAL','Ordem de Compra')  AND UA_OPER ='3' THEN UA_NUM  END ATEND_OUTRAS,	 
 			UA_MIDIA																																			 
 			FROM(																																				 
 				SELECT UA_FILIAL, UA_VEND,A3_NOME,UA_NUM,UA_EMISSAO,UA_OPER,UA_MIDIA,ISNULL(C6_VALOR,0)C6_VALOR,SC6.D_E_L_E_T_ SC6_DELET,C6_CF 						 
 				FROM SUA010 SUA(NOLOCK)																															 
 				JOIN SA3010 SA3 (NOLOCK)ON LEFT(UA_FILIAL,4) = A3_FILIAL AND A3_COD =UA_VEND AND SA3.D_E_L_E_T_=''												 
 				LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 																	 
 				LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''													 
 				WHERE 1=1																																		 
 				AND UA_FILIAL='020101'	                                                                                                     
		        AND UA_VEND BETWEEN '000082' AND '000082' 																							 
 				AND UA_EMISSAO BETWEEN '20210101' AND '20210604'																			 
 				AND SUA.D_E_L_E_T_=''																															 
 				AND (C5_CLIENTE BETWEEN '      ' AND 'ZZZZZZ' OR C5_CLIENTE IS NULL)																 
 				AND (C5_LOJACLI BETWEEN '    ' AND 'ZZZZ' OR C5_LOJACLI IS NULL)	
				

 				)AA																																				 
           INNER JOIN SUH010  SUH (NOLOCK) ON SUBSTRING(UA_FILIAL,1,4)= UH_FILIAL AND UA_MIDIA = UH_MIDIA AND SUH.D_E_L_E_T_=''              
 		)BB																																						 
 	GROUP BY UA_FILIAL,UA_VEND,A3_NOME																															 
 	ORDER BY A3_NOME,UA_FILIAL