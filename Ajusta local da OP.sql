

select H6_LOCAL,* from SH6010 where H6_OP = '03158001001' AND H6_FILIAL = '020101'

select * from SD3010 where D3_OP = '03158001001' AND D3_FILIAL = '020101' and D3_TM = '010'

select C2_OP, * from SC2010 where C2_NUM = '031580' AND C2_SEQUEN = '001' AND C2_FILIAL = '020101'

select * from SB9010 where B9_COD = '001060' order by B9_DATA

--begin transaction

--update SH6010 set H6_LOCAL = '04' where H6_OP = '03158001001' AND H6_FILIAL = '020101'

--update SD3010 set D3_LOCAL = '04' where D3_OP = '03158001001' AND D3_FILIAL = '020101' and D3_TM = '010'

--update SC2010 set C2_LOCAL = '04' where C2_NUM = '031580' AND C2_FILIAL = '020101' AND C2_SEQUEN = '001'

--commit




update SB9010 set B9_VINI1 = '0' where B9_COD = '001060' and B9_FILIAL = '030102' and B9_DATA in ('20220531','20220630')


