 select distinct E1_FILIAL, E1_NUM, E1_CLIENTE,E1_VENCTO, E1_VALOR, * from SE1010 where E1_CLIENTE IN ('023642','092490') AND E1_BAIXA = ''

select * from ACF010 where ACF_CLIENT = '103566' order by ACG_DTVENC

 select * from SK1010
 where K1_TIPO IN ('FT', 'NF')
			AND K1_VENCTO between '20220813' and '20220815'
			AND D_E_L_E_T_ = ''
			AND K1_FILORIG = '010101'
		  
 order by K1_CLIENTE

 select * from ACG010 where ACG_TIPO IN ('FT', 'NF')	AND ACG_DTVENC between '20220813' and '20220815' order by ACG_DTVENC

 select * from FRV010

 select * from SA1010 where A1_COD in ('023642','092490')

 select * from SU5010 where U5_FILIAL = '0101' AND U5_ULTCONT >= '20220101'

--select * from SU4010 where U4_OPERAD = '000184' and D_E_L_E_T_ = ''

 --begin transaction

 --update SU4010 set D_E_L_E_T_ = '*' where U4_LISTA = '362660' and U4_DATA = '20220614'
 --commit
