


select * from SW3010 where W3_PO_NUM = 'HRS 064'

select * from SW4010 where W4_PO_NUM = 'HRS 064'

 --Itens de Prepara��o da Licen�a de importa��o
select * 
	from SW5010 
		where W5_PO_NUM = 'HRS 064' 

-- Capa da declara��o de importa��o
select * 
	from SW6010 
		where W6_PO_NUM = 'HRS 064'  

--Despesas Declarta��o Importa��o
select * 
	from SWD010 
		where WD_HAWB = 'HRS 064' 

--itens da NF de Importa��o

select * 
	from SWN010 
		where WN_HAWB = 'HRS 064' 

-- Despesas NF
select * 
	from SWW010 
		where WW_HAWB = 'HRS 064' 
		order by WW_DESPESA




