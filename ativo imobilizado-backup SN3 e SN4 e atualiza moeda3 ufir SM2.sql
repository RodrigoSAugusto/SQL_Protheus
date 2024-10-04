--BACKUP
--select * INTO BKP_SM2010_20210119 from SM2010


--############################################################
--ATUALIZA MOEDA 03 UFIR
select * 

--begin transaction update SM2 SET M2_MOEDA3=0.8287
from SM2010 SM2
where M2_DATA like'202005%'
order by 1
--COMMIT

--############################################################
--BACKUP SN3 E SN4
--fazer backup das tabelas SN3010 e SN4010 em Ctree para facilitar o restore via APSDU(zap + append)
--salvar arquivo com nome SN3010_BKP_20210119 onde o final é a data do backup

