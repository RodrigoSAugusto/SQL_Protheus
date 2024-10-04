---------------------------------------------------------------------------------------------------
-- CONSULTA FINAL PARA TRASER FALTAS E ATRASOS APONTADOS E PRESENTES NA SP8010 (PERÍODO VIGENTE)
---------------------------------------------------------------------------------------------------
DECLARE @DATA1 VARCHAR(8)
DECLARE @DATA2 VARCHAR(8)
SET @DATA1 = '20230916'
SET @DATA2 = '20240318'

SELECT RA_FILIAL, RA_MAT , RA_NOME , CASE 
	WHEN PC_ABONO	IS NULL THEN 
	(CASE WHEN RA_SITFOLH = '' THEN 'FALTA'
	WHEN RA_SITFOLH = 'F' THEN 'FERIAS'
	WHEN RA_SITFOLH = 'A' THEN 'AFASTAMENTO' END)						
	WHEN PC_ABONO IS NOT NULL THEN P6_DESC
	END MOTIVO, CTT_DESC01 
FROM SRA010 RA
INNER JOIN CTT010 CTT ON CTT_FILIAL = RA_FILIAL 
	AND CTT_CUSTO = RA_CC AND CTT.D_E_L_E_T_ = '' AND RA.D_E_L_E_T_ ='' 
LEFT OUTER JOIN SPC010 SPC ON PC_FILIAL = RA_FILIAL AND RA_MAT = PC_MAT 
	AND PC_ABONO <> '' AND SPC.D_E_L_E_T_ = '' AND PC_DATA >= @DATA1 AND PC_DATA <= @DATA2
LEFT OUTER JOIN SP6010 SP6 ON P6_FILIAL = LEFT(PC_FILIAL,4) 
	AND P6_CODIGO = PC_ABONO AND SP6.D_E_L_E_T_ = ''
WHERE 1=1 
AND RA_MAT  = '002339 '
AND RA_SITFOLH NOT IN ('T','D')
AND RA_FILIAL = '010101'
AND RA_MAT < '900000' 
AND RA_TNOTRAB <> '999'
AND RA_ADMISSA < @DATA1
ORDER BY RA_NOME


-------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTA FINAL PARA TRASER FALTAS E ATRASOS APONTADOS E PRESENTES NA SPC010 (HISTÓRICO)
-------------------------------------------------------------------------------------------------------------------------------------

SELECT RA_MAT , RA_NOME , CASE                                                                    
        WHEN PC_ABONO	IS NULL THEN                                                                   
        (CASE WHEN RA_SITFOLH = '' THEN 'FALTA'                                                       
        WHEN RA_SITFOLH = 'F' THEN 'FERIAS'                                                           
        WHEN RA_SITFOLH = 'A' THEN 'AFASTAMENTO' END)                                                 
        WHEN PC_ABONO IS NOT NULL THEN P6_DESC                                                        
        END MOTIVO, CTT_DESC01                                                                        
    FROM SRA010 RA                                                                                    
    INNER JOIN CTT010 CTT ON CTT_FILIAL = RA_FILIAL                                                   
        AND CTT_CUSTO = RA_CC AND CTT.D_E_L_E_T_ = '' AND RA.D_E_L_E_T_ =''                           
    LEFT OUTER JOIN SPC010 SPC ON PC_FILIAL = RA_FILIAL AND RA_MAT = PC_MAT                           
        AND PC_ABONO <> '' AND SPC.D_E_L_E_T_ = '' AND PC_DATA >= '20230801'             
        AND PC_DATA <='20240618'                                                         
    LEFT OUTER JOIN SP6010 SP6 ON P6_FILIAL = LEFT(PC_FILIAL,4)                                       
        AND P6_CODIGO = PC_ABONO AND SP6.D_E_L_E_T_ = ''                                              
    WHERE 1=1                                                                                         
    AND RA_MAT  = '002339 '          
    AND RA_SITFOLH NOT IN ('T','D')                                                                   
    AND RA_FILIAL = '010101'                                                        
    AND RA_MAT < '900000'                                                                             
    AND RA_MAT >= ''                                                                  
    AND RA_MAT <= 'ZZZZZZ'                                                                  
    AND RA_TNOTRAB <> '999'                                                                           
    AND RA_ADMISSA < '20231017'                                                         
    ORDER BY RA_NOME                                                                                  


-------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTA FINAL PARA TRASER FALTAS E ATRASOS APONTADOS E PRESENTES NA SPC010 (HISTÓRICO) ------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
	
SELECT DISTINCT PH_MAT,CONVERT(VARCHAR(10), CONVERT(DATE,PH_DATA,103),103) PPdata , PH_DATA, PH_ABONO,  ISNULL(P6_DESC,P9_DESC), PH_QUANTC                                               
FROM SPH010 SPH
LEFT  JOIN SP6010 SP6 ON P6_FILIAL = LEFT(PH_FILIAL,4) AND P6_CODIGO = PH_ABONO AND SP6.D_E_L_E_T_ = ''
LEFT JOIN SP9010 SP9 ON P9_CODIGO = PH_PD
WHERE PH_FILIAL = '010101' 
AND PH_MAT = '002339 ' 
AND PH_DATA >= '20230701'
AND PH_DATA <= '20240318'
--AND PH_QUANTC >= '1'
--AND PH_QUANTC < '7.49'
AND PH_PD IN ('011', '012', '013', '014')
and SPH.D_E_L_E_T_ = ''
--AND PH_ABONO <> ''
order by PH_DATA

-------------------------------------------------------------------------------------------------------------------------------------
--CONSULTAS COMPLEMENTARES PARA AUXILIO NO DESENVOLVIMENTO DO SQL FINAL--------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------



SELECT RA_MAT , RA_NOME, PC_DATA , CASE                                                                    
        WHEN PC_ABONO	IS NULL THEN                                                                   
        (CASE WHEN RA_SITFOLH = '' THEN 'FALTA'                                                       
        WHEN RA_SITFOLH = 'F' THEN 'FERIAS'                                                           
        WHEN RA_SITFOLH = 'A' THEN 'AFASTAMENTO' END)                                                 
        WHEN PC_ABONO IS NOT NULL THEN P6_DESC                                                        
        END MOTIVO, CTT_DESC01                                                                        
    FROM SRA010 RA                                                                                    
    INNER JOIN CTT010 CTT ON CTT_FILIAL = RA_FILIAL                                                   
        AND CTT_CUSTO = RA_CC AND CTT.D_E_L_E_T_ = '' AND RA.D_E_L_E_T_ =''                           
    LEFT OUTER JOIN SPC010 SPC ON PC_FILIAL = RA_FILIAL AND RA_MAT = PC_MAT                           
       -- AND PC_ABONO <> '' 
		AND SPC.D_E_L_E_T_ = '' AND PC_DATA >= '20230701'             
        AND PC_DATA <='20240318'                                                         
    LEFT OUTER JOIN SP6010 SP6 ON P6_FILIAL = LEFT(PC_FILIAL,4)                                       
        AND P6_CODIGO = PC_ABONO AND SP6.D_E_L_E_T_ = ''                                              
    WHERE 1=1                                                                                         
    AND RA_MAT = '002339 '          
    AND RA_SITFOLH NOT IN ('T','D')                                                                   
    AND RA_FILIAL = '010101'                                                        
   -- AND RA_MAT < '900000'                                                                             
   -- AND RA_MAT >= ''                                                                  
  --  AND RA_MAT <= 'ZZZZZZ'                                                                  
    AND RA_TNOTRAB <> '999'                                                                           
   -- AND RA_ADMISSA < '20231017'                                                         
    ORDER BY RA_NOME         
	


	
SELECT DISTINCT RA_MAT , RA_NOME, PH_DATA , CASE                                                                    
        WHEN PH_ABONO	IS NULL THEN                                                                   
        (CASE WHEN RA_SITFOLH = '' THEN 'FALTA'                                                       
        WHEN RA_SITFOLH = 'F' THEN 'FERIAS'                                                           
        WHEN RA_SITFOLH = 'A' THEN 'AFASTAMENTO' END)                                                 
        WHEN PH_ABONO IS NOT NULL THEN P6_DESC                                                        
        END MOTIVO, CTT_DESC01                                                                        
    FROM SRA010 RA                                                                                    
    INNER JOIN CTT010 CTT ON CTT_FILIAL = RA_FILIAL                                                   
        AND CTT_CUSTO = RA_CC AND CTT.D_E_L_E_T_ = '' AND RA.D_E_L_E_T_ =''                           
    LEFT OUTER JOIN SPH010 SPH ON PH_FILIAL = RA_FILIAL AND RA_MAT = PH_MAT                           
       -- AND PH_ABONO <> '' 
		AND SPH.D_E_L_E_T_ = '' AND PH_DATA >= '20230701'             
        AND PH_DATA <='20240318'                                                         
    LEFT OUTER JOIN SP6010 SP6 ON P6_FILIAL = LEFT(PH_FILIAL,4)                                       
        AND P6_CODIGO = PH_ABONO AND SP6.D_E_L_E_T_ = ''                                              
    WHERE 1=1                                                                                         
    AND RA_MAT = '002339'          
    AND RA_SITFOLH NOT IN ('T','D')                                                                   
    AND RA_FILIAL = '010101'                                                        
   -- AND RA_MAT < '900000'                                                                             
   -- AND RA_MAT >= ''                                                                  
  --  AND RA_MAT <= 'ZZZZZZ'                                                                  
    AND RA_TNOTRAB <> '999'                                                                           
   -- AND RA_ADMISSA < '20231017'                                                         
    ORDER BY RA_NOME         

	
SELECT * FROM SP9010

SELECT * FROM SP6010
	
	
SELECT DISTINCT * 
FROM SPC010 SPC
WHERE PC_FILIAL = '010101' 
AND PC_MAT = '002339' 
AND PC_DATA >= '202300701'
AND PC_DATA <= '20240318'
--AND PC_ABONO <> ''
order by PC_DATA


SELECT DISTINCT * 
FROM SPH010 
WHERE PH_FILIAL = '010101' 
AND PH_MAT = '002339 ' 
AND PH_DATA >= '20230701'
AND PH_DATA <= '20240318'
AND PH_ABONO <> ''

	
SELECT DISTINCT * 
FROM SP8010 SP8
WHERE P8_FILIAL = '010101' 
AND P8_MAT = '002339 ' 
AND P8_DATA >= '20230916'
AND P8_DATA <= '20240318'


select * from SRA010 where RA_MAT= '002428'


SELECT DISTINCT P6_DESC, * 
FROM SPC010 SPC
LEFT OUTER JOIN SP6010 SP6 ON P6_FILIAL = LEFT(PC_FILIAL,4) AND P6_CODIGO = PC_ABONO AND SP6.D_E_L_E_T_ = '' 
WHERE PC_FILIAL = '010101' 
AND PC_MAT = '002339 ' 
AND PC_DATA = '20231008'



SELECT * FROM CTT010

SELECT * FROM SPH010 WHERE PH_FILIAL = '010101' AND PH_DATA <= '20231018' ORDER BY PH_DATA

SELECT * FROM SP8010

SELECT * FROM SP6010 WHERE P6_FILIAL = '0101'

select * from SPC010

SELECT * from SP8010 where P8_APONTA = 'S' and P8_FILIAL = '030102' order by P8_DHORG

SELECT * from SPG010
