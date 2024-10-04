----------------------------------------------------------
-- Select and update to change the vendor of Client(SA1010) 
-- and Prospet(SUS010) table.
-- you just need to change de vendor and the list of clients
-- and run de update. Dont forget to run the commit comand below.
----------------------------------------------------------
COMMIT

 --BEGIN TRANSACTION UPDATE SA1010 SET A1_VEND = '121073'
 --SELECT DISTINCT A1_VEND,A1_FILIAL, A1_COD, A1_LOJA, A1_NOME, A1_EST, A1_MUN, A1_DDD, A1_TEL, A1_EMAIL, A1_CODSEG  FROM SA1010
	WHERE 1=1
	AND D_E_L_E_T_ = '' 
	AND A1_FILIAL = '0301'
	AND A1_EST IN ('RS','SC','PR')
	AND A1_CODSEG = '000042'
	--AND	A1_VEND = '000118'
	--AND A1_COD IN ('012022','054036','930298','931273','931289','932383','932463','935364','935375','936602','938222','942379','943284','943706' )


-- COMMIT
ROLLBACK

-- BEGIN TRANSACTION UPDATE SUS010 SET US_VEND = '121073'
-- SELECT distinct US_VEND,* FROM SUS010
	WHERE 
	D_E_L_E_T_	= '' 
	AND	US_FILIAL	= '0301'
	AND US_EST IN ('RS','SC','PR')
	--AND US_COD = '000227'		
	AND US_CODSEG IN ('000042')
	--AND US_VEND = '000020' 
	--AND US_COD IN ('012022','054036','930298')

--COMMIT


ROLLBACK

-- PASSAR DA VENDEDORA CARINA PARA A RENATA, E DEPOIS DO PROVISÓRIO PARAR A CARINA
-- BEGIN TRANSACTION UPDATE SUA010 SET  UA_OPERADO = '000096'
-- SELECT UA_VEND, * FROM SUA010 
	--WHERE 
	--D_E_L_E_T_	= '' 
	--AND	UA_FILIAL	= '010101'
	--AND UA_NUM = '549809 '
	--AND UA_VEND = '121057'
	--AND UA_OPERADO = '000048'
	--AND UA_EMISSAO >= '20230101'
	--AND	UA_CLIENTE IN (	'023476','933187','938640','117300','792729','116287','938574','114805','932773','031703','939543','933998',
	--					'058884','113116','932201','108963','934546','931578','938862','939255','938217','931888','933877','931567',
	--					'930596','938424','052181','933207','937030','932212','118754','938640','938332','938020','928187','937139' )





	
--BEGIN TRANSACTION UPDATE SUA010 SET UA_VEND = '121057', UA_OPERADO = '000184'
--SELECT  * FROM SUA010 
	--WHERE 
	--D_E_L_E_T_	= '' 
	--AND	UA_FILIAL	= '010101' 
	--AND UA_VEND = '121076' 
	--AND	UA_CLIENTE IN (	)

-- COMMIT
ROLLBACK

-----------------------------------------------------------------
-- Change the ownership of a operator scheduler to another one.
-----------------------------------------------------------------

--SELECT * FROM SU4010 WHERE U4_DESC LIKE '%417104%' AND U4_STATUS = '2'

--SELECT * FROM SUS010 WHERE US_COD = '561985' AND U4_STATUS = '1'

--BEGIN TRANSACTION UPDATE SU4010 SET U4_OPERAD = '000142'
	--WHERE  	U4_FILIAL	= '010101'
	--AND U4_STATUS = '2'
	--AND U4_OPERAD = '000192'
	--AND U4_DESC LIKE '%417104%'
	--COMMIT
	--ROLLBACK

	--BEGIN TRANSACTION UPDATE SB2010 SET B2_VATU3 = 0, B2_VFIM3 = 0, B2_CM3 = 0  WHERE B2_VATU3 < 0 
	--SELECT * FROM SB2010 WHERE B2_VATU3 < 0


-----------------------------------------------------------------
-- Clean the operator scheduler from a date to before.
-----------------------------------------------------------------

SELECT * FROM SU4010 WHERE U4_OPERAD = '000316' and D_E_L_E_T_ = '*' AND U4_DATA <= '20230301'

--BEGIN TRANSACTION UPDATE SU4010 SET U4_OPERAD = '000142'
--WHERE  	U4_FILIAL	= '010101'
	--AND U4_STATUS = '1'
--	AND U4_OPERAD = '000192'
--	AND U4_DATA <= '20230301'

--COMMIT


--SELECT * FROM SA3010 WHERE A3_OPERAD = '000192'

SELECT * FROM SUA010 WHERE 1=1


-- BEGIN TRANSACTION UPDATE SUA010 SET UA_STATUS = 'CAN', UA_CANC = 'S'
-- SELECT UA_STATUS,UA_CANC, UA_NUM, UA_CLIENTE, UA_EMISSAO 
	FROM SUA010 
		WHERE UA_FILIAL = '030101' AND 
		UA_EMISSAO <= '20230520' AND 
		UA_STATUS = 'SUP' AND
		UA_OPERADO = '000015'
		ORDER BY UA_EMISSAO
















