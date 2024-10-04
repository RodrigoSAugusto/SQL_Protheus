

select * from ZRP010


select * from SA1010 WHERE A1_NOME LIKE '%CARRAS%'

SELECT * FROM SA3010 WHERE A3_COD = '120936'

 WHERE U4_DESC LIKE '%234100%'

-------------------------------------------------------------------------------------
--Retira atendimento da Agenda
-------------------------------------------------------------------------------------
--BEGIN TRANSACTION UPDATE SU4010 SET U4_STATUS = '2'
-- SELECT * FROM SU4010
	 WHERE 1=1 AND
	 U4_DESC LIKE '%286013%' AND --Numero do atendimento para cancelar
	 U4_FILIAL = '020101'

-- COMMIT

-------------------------------------------------------------------------------------
--Altera status do atendimento
-------------------------------------------------------------------------------------
--BEGIN TRANSACTION UPDATE SUA010 SET UA_STATUS = 'CAN'
--SELECT UA_STATUS,UA_CANC, UA_NUM, UA_CLIENTE, UA_EMISSAO 
	FROM SUA010 
		WHERE UA_FILIAL = '030101' AND 
		UA_EMISSAO <= '20230520' AND 
		UA_STATUS NOT IN ('CAN','NF.','LIB','ORC')
		ORDER BY UA_EMISSAO

		
SELECT UA_STATUS,UA_CANC, UA_NUM, UA_CLIENTE, UA_EMISSAO 
	FROM SUA010 
		WHERE UA_FILIAL = '030101' AND 
		UA_NUM = '126129'
		--UA_EMISSAO <= '20230520' AND 
		--UA_STATUS NOT IN ('CAN','NF.','LIB','ORC')
		ORDER BY UA_EMISSAO


-------------------------------------------------------------------------------------
--Retira atendimento da Agenda
-------------------------------------------------------------------------------------
select * from XX7010 order by XX7_CODFUN

select * from SB1010 where B1_GRUPO = '910'

select * from SYS_USR where USR_NOME like '%BEATRI%'

select * from SUA010 where UA_OPERADO = '000056' and UA_EMISSAO >= '20230701' and UA_EMISSAO <= '20230715'


