
--Select para verificar os atendimentos da Agenda.

-- Filtrar corretamente filial operador e péríodo desejado.
SELECT U4_STATUS ,
* FROM SU4010
WHERE 1=1
AND U4_FILIAL	= '020101'
AND U4_OPERAD	= '000341'
--AND U4_DATA	   >= '20211215'
--AND U4_DATA	   <= '20230401' 
AND U4_LISTA LIKE '%466828%'
--AND U4_STATUS <>'2'


--BEGIN TRANSACTION UPDATE SU4010 SET U4_STATUS = '2', D_E_L_E_T_ = '' WHERE 1=1
AND U4_FILIAL	= '020101'
AND U4_OPERAD	= '000341'
--AND U4_DATA	   >= '20240410'
--AND U4_DATA	   <= '20240516' 
AND U4_LISTA LIKE '%466828%'
--AND U4_CODLIG IN ('496492','534327')
--AND U4_STATUS <>'2'

--COMMIT








