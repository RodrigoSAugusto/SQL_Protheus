select * from SB8010
	where B8_PRODUTO = '000748'
	and B8_LOTECTL like '%44188%'


select * from SB8010
	where B8_PRODUTO = '000748'
	and B8_LOTECTL like '%A0001VE%'

Select * from SD4010
where D4_FILIAL = '030102'
and D4_OP = 'I0234501001'
and D4_COD = '000748'

--begin transaction

	--update SB8010 set B8_EMPENHO = '' where B8_PRODUTO = '000748'
	--and B8_LOTECTL = 'A0001VE'

--commit