SELECT 
D1_VALICM,
--SUM(D1_TOTAL)
*
--begin transaction UPDATE SD1 SET D1_VALICM=D1_VALICM+0.01
FROM SD1010 SD1
WHERE D1_DOC ='000095812'
--AND D1_COD='001175'
and	D_E_L_E_T_=''

SELECT 
D2_VALICM,
--SUM(D1_TOTAL)
*
--begin transaction UPDATE SD2 SET D2_VALICM=D2_VALICM+0.01
FROM SD2010 SD2
WHERE D2_DOC ='000095812'
--AND D1_COD='001175'
and	D_E_L_E_T_=''


SELECT 
F1_VALBRUT,
F1_VALICM,
* 
--begin transaction UPDATE SF1 SET F1_VALICM=F1_VALICM+0.01
FROM SF1010 SF1
WHERE F1_DOC ='000095812'
and	D_E_L_E_T_=''

SELECT 
--F1_VALBRUT,
F2_VALICM,
* 
--begin transaction UPDATE SF2 SET F2_VALICM=F2_VALICM+0.01

FROM SF2010 SF2
WHERE F2_DOC ='000095812'
and	D_E_L_E_T_=''

SELECT 
F3_VALICM,
*
--begin transaction UPDATE SF3 SET F3_VALICM=F3_VALICM+0.01

FROM SF3010 SF3
WHERE F3_NFISCAL ='000095812'
and	D_E_L_E_T_=''

SELECT 
--SUM(FT_VALCONT)
FT_VALICM,
FT_TOTAL,
* 
--begin transaction UPDATE SFT SET FT_VALICM=FT_VALICM+0.01
FROM SFT010 SFT
WHERE FT_NFISCAL ='000095812'
and	D_E_L_E_T_=''
--AND FT_FILIAL ='030101'
--AND FT_PRODUTO='001175'
--COMMIT
