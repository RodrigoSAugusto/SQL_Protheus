

SELECT * FROM SC5010 WHERE C5_NUM = '105603'

SELECT * FROM ZCF010 WHERE ZCF_NUM = '590193' -- AND D_E_L_E_T_ = '' AND ZCF_FILIAL = ''

--CONSULTA PARA ADICIONAR A QUANTIDADE DE VOLUMES NO PEDIDO/PRE-NOTA

SELECT SUM(ZCF_VOLUME) AS VOLUMES FROM ZCF010 ZCF
		LEFT JOIN SUA010 ON ZCF_FILIAL = UA_FILIAL AND ZCF_NUM = UA_NUM
		WHERE UA_NUMSC5 = '105603 '
		AND UA_FILIAL = '010101'
		GROUP BY ZCF_NUM, VOLUMES

SELECT * FROM SUA010 WHERE UA_NUM = '498142'

SELECT SUM(ZCF_VOLUME) AS VOLUMES 
                FROM ZCF010 ZCF
                    LEFT JOIN SUA010 
                    ON ZCF_FILIAL = UA_FILIAL 
                    AND ZCF_NUM = UA_NUM
                        WHERE   UA_NUMSC5 = '105212'
                            AND UA_FILIAL = '010101'


select UA_NUMSC5, * from SUA010 where 1=1 
		AND UA_NUMSC5 = '105603' 
		AND UA_NUM = '584517'

SELECT DISTINCT ZCF_NUM FROM ZCF010 WHERE ZCF_FILIAL = '010101'  
    AND ZCF_EMISSA >= '20230101'
    AND ZCF_EMISSA <= '20230430'

SELECT * FROM ZCF010 
	WHERE ZCF_DTORC >= '20230201' 
		AND ZCF_DTORC <= '20230330'

SELECT * FROM SA3010 WHERE A3_COD = '120886'

SELECT	
    ZCF_STATUS, ZCF_NUM, ZCF_ITEM,
    UA_CLIENTE, A1_NOME,
    A1_CGC, US_NOME,
	US_CGC, UA_NUMSC5, A3_NREDUZ,
    CONCAT((CONVERT(VARCHAR,CONVERT(DATE,ZCF_EMISSA), 103)),' ',CONVERT(VARCHAR,CONVERT(TIME,ZCF_EMISSA), 108)) AS EMIDATE,
    CASE WHEN ZCF_DTORC = '-' THEN '-' else CONCAT(CONVERT(VARCHAR,CONVERT(DATE,ZCF_DTORC), 103), ' ' ,CONVERT(VARCHAR,CONVERT(TIME,ZCF_DTORC), 108)) END AS ORCDATE,
    ZCF_VFRETE,
    ZCF_VALPED,
    ZCF_VOLUME,
    ZCF_PESO,
    ZCF_ALTURA,
    ZCF_LARGUR,
    ZCF_COMPRI,
    ZCF_OBS
    FROM 
	ZCF010 ZCF 
	LEFT OUTER JOIN SUA010 SUA ON ZCF_FILIAL = UA_FILIAL AND ZCF_NUM = UA_NUM
    LEFT OUTER JOIN SA1010 SA1 ON UA_CLIENTE = A1_COD AND UA_LOJA = A1_LOJA AND LEFT(UA_FILIAL,4) = A1_FILIAL AND SA1.D_E_L_E_T_ = ''
    LEFT OUTER JOIN SUS010 SUS ON UA_CLIENTE = US_COD AND UA_LOJA = US_LOJA AND LEFT(UA_FILIAL,4) = US_FILIAL AND SUS.D_E_L_E_T_ = ''
	LEFT OUTER JOIN SA3010 SA3 ON UA_VEND = A3_COD AND LEFT(UA_FILIAL,4) = A3_FILIAL
    WHERE ZCF_FILIAL = '010101'  
    AND ZCF_EMISSA >= '20230314 00:00:00'
    AND ZCF_EMISSA <= '20230314 23:59:59'
    AND ZCF.D_E_L_E_T_ = ''
	AND ZCF_ITEM IN('1','2','3')
	--and ZCF.R_E_C_N_O_ IN ('40','51','55','56','84','2','7','4','6','11','12','13','14','20','18','17','24','19','27','28','34','37','54','41','53','42','49','57','59','62','60','61','71','74','75','82','85','89','88','92')
    AND ZCF_STATUS IN ('1','2','3')
    ORDER BY EMIDATE DESC



  SELECT	                                                                                                                                                        
        ZCF_STATUS,                                                                                                                                                        
        ZCF_NUM,                                                                                                                                                           
        UA_CLIENTE,                                                                                                                                                        
        A1_NOME,                                                                                                                                                           
        A1_CGC,                                                                                                                                                            
        US_NOME,                                                                                                                                                           
         US_CGC,                                                                                                                                                           
        UA_NUMSC5,A3_NREDUZ,                                                                                                                                               
        CONCAT((CONVERT(VARCHAR,CONVERT(DATE,ZCF_EMISSA), 103)),' ',CONVERT(VARCHAR,CONVERT(TIME,ZCF_EMISSA), 108)) AS EMIDATE,                                            
        CASE WHEN ZCF_DTORC = '-' THEN '-' else CONCAT(CONVERT(VARCHAR,CONVERT(DATE,ZCF_DTORC), 103), ' ' ,CONVERT(VARCHAR,CONVERT(TIME,ZCF_DTORC), 108)) END AS ORCDATE,  
        ZCF_VFRETE,                                                                                                                                                        
        ZCF_VALPED,                                                                                                                                                        
        ZCF_PESO,                                                                                                                                                          
        ZCF_OBS                                                                                                                                                            
        FROM ZCF010 ZCF LEFT OUTER JOIN                                                                                                                                    
        SUA010 SUA ON UA_FILIAL = ZCF_FILIAL AND ZCF_NUM = UA_NUM                                                                                                          
        LEFT OUTER JOIN SA1010 SA1 ON A1_COD = UA_CLIENTE AND A1_LOJA = UA_LOJA AND A1_FILIAL = LEFT(UA_FILIAL,4) AND SA1.D_E_L_E_T_ = ''                                      
        LEFT OUTER JOIN SUS010 SUS ON US_COD = UA_CLIENTE AND US_LOJA = UA_LOJA AND US_FILIAL = LEFT(UA_FILIAL,4) AND SUS.D_E_L_E_T_ = ''                                      
        LEFT OUTER JOIN SA3010 SA3 ON UA_VEND = A3_COD AND LEFT(UA_FILIAL,4) = A3_FILIAL                                                                                   
        WHERE ZCF_FILIAL = '010101'                                                                                                                           
        AND ZCF_EMISSA >= '20230101'                                                                                                                          
        AND ZCF_EMISSA <= '20230430'                                                                                                                            
        AND ZCF.D_E_L_E_T_ = ''                                                                                                                                            
        AND ZCF_ITEM = '1'                                                                                                                                                 
        AND ZCF_STATUS IN ('1','2','3')                                                                                                                                    
        ORDER BY ZCF_EMISSA DESC                                                                                                                                           





SELECT	ZCF_FILIAL, 
		ZCF_NUM,
		ZCF_VFRETE,
		ZCF_STATUS,
		R_E_C_N_O_
		FROM ZCF010
			WHERE ZCF_FILIAL  = '010101'                                                                                                                           
			  AND ZCF_EMISSA >= '20230101 00:00:00'                                                                                                                          
			  AND ZCF_EMISSA <= '20230430 23:59:59'
			  AND ZCF_STATUS  = '1'
			  AND ZCF_VFRETE != '0'
			  AND D_E_L_E_T_  = ''


SELECT * FROM ZCF010

--BEGIN TRANSACTION UPDATE ZCF010
	SET ZCF_OBS = 'SÃO MIGUEL 3 DIAS                                                                                                                                     '
	, D_E_L_E_T_  = ''
	WHERE ZCF_NUM = '511950'

	--COMMIT 


