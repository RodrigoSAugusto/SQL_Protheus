--ARRUMAR PODER DE TERCEIRO

--VERIFICA SE TEVE RETORNO

select D1_IDENTB6,D1_NFORI,D1_DOC,D1_TIPO,D1_VALDEV, D1_QTDEDEV,* from SD1010
where 1=1
AND D1_NFORI='000026385'
--AND D1_DOC='000316031'
AND D1_FORNECE='106504'


--VERIFICAR IDENT PD3
SELECT B6_IDENTB6,B6_IDENT,* 
--BEGIN TRANSACTION UPDATE SB6 SET B6_IDENTB6='578721'
--BEGIN TRANSACTION UPDATE SB6 SET B6_IDENT='99HER5'
--BEGIN TRANSACTION UPDATE SB6 SET D_E_L_E_T_='*', R_E_C_D_E_L_=R_E_C_N_O_	
--BEGIN TRANSACTION UPDATE SB6 SET B6_SALDO=37
--BEGIN TRANSACTION UPDATE SB6 SET B6_SALDO=0,		B6_ATEND='S'
FROM SB6010 SB6
WHERE 1=1
--AND B6_FILIAL='010102'
--AND B6_CLIFOR='928791'
AND B6_DOC='000026385'
AND B6_PRODUTO='000424'
--and B6_IDENT='99B3H1'

--168
--198


--INCLUIR NA NF DE SAIDA
select D2_IDENTB6,D2_DOC,D2_TIPO,D2_QTDEDEV, D2_VALDEV, * 
--BEGIN TRANSACTION UPDATE SD2 SET D2_IDENTB6='578721'
--begin transaction update SD2 SET D2_QTDEDEV=23,	D2_VALDEV=115,D2_SERIE=1  

from SD2010 SD2
WHERE 1=1
AND D2_DOC='000020492'
--AND D2_CLIENTE='117379'

--COMMIT

--VERIFICA SE TES � PD3
SELECT * FROM SF4010
WHERE F4_CODIGO in('643','124')
AND D_E_L_E_T_=	''


--select * from SB2010 WHERE B2_COD='009044'

--SELECT * FROM SD3010 WHERE D3_COD='009044'







