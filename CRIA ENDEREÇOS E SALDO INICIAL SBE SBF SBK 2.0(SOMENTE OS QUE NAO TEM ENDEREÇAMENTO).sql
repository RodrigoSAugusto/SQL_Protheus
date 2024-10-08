--SELECT * FROM SX6010
--WHERE 1=1
----AND X6_VAR LIKE'MV_CBPE0%'
--AND X6_VAR='MV_INTACD'

SELECT  DISTINCT BF_PRODUTO FROM SBF010

select * from SBE010
where BE_FILIAL='010101'
AND D_E_L_E_T_=''

SELECT  BK_COD,* FROM SBK010


--ROLLBACK
--COMMIT

--#########################
--cadastrar endere�os na SBE

--BEGIN TRANSACTION INSERT INTO SBE010 (BE_FILIAL,BE_LOCAL,BE_LOCALIZ,BE_DESCRIC,BE_PRIOR,BE_STATUS,BE_DATGER,BE_NRUNIT,R_E_C_N_O_)
SELECT 
NNR_FILIAL BE_FILIAL,
NNR_CODIGO BE_LOCAL,
'10' BE_LOCALIZ,
'10'BE_DESCRIC,
'ZZZ'BE_PRIOR,
1 BE_STATUS,
'20210406'BE_DATGER,
1 BE_NRUNIT,
(SELECT ISNULL(MAX(R_E_C_N_O_),0) FROM SBE010)+ rank() OVER (ORDER BY NNR_FILIAL, NNR_CODIGO) R_E_C_N_O_
FROM NNR010
WHERE 1=1
AND NNR_FILIAL='010101'
AND D_E_L_E_T_=''
--AND NNR_CODIGO<>'01'


--commit
--rollback
--######################
--INSERE NOS ENDERE�OS

--BEGIN TRANSACTION INSERT INTO SBF010 (BF_FILIAL,BF_PRODUTO,BF_LOCAL,BF_PRIOR,BF_LOCALIZ,BF_LOTECTL,BF_QUANT,BF_QTSEGUM,BF_EMPENHO,R_E_C_N_O_)
SELECT 
B8_FILIAL BF_FILIAL,
B8_PRODUTO BF_PRODUTO,
B8_LOCAL BF_LOCAL,
'ZZZ' BF_PRIOR,
'999' BF_LOCALIZ,
B8_LOTECTL BF_LOTECTL,
B8_SALDO BF_QUANT,
B8_SALDO2 BF_QTSEGUM,
B8_EMPENHO BF_EMPENHO,
(SELECT ISNULL(MAX(R_E_C_N_O_),0) FROM SBF010)+ rank() OVER (ORDER BY B8_FILIAL, B8_LOCAL, B8_PRODUTO, B8_LOTECTL) R_E_C_N_O_
FROM SB8010 SB8
LEFT JOIN SBF010 SBF ON BF_FILIAL= B8_FILIAL AND BF_LOTECTL= B8_LOTECTL AND BF_PRODUTO=B8_PRODUTO AND SBF.D_E_L_E_T_=''
WHERE B8_FILIAL='010101'
--AND B8_PRODUTO='028604'
--AND B8_PRODUTO IN (
--'000757',         
--'005406',         
--'006455',         
--'007516',         
--'008938')         
AND B8_SALDO >0
AND SB8.D_E_L_E_T_=''
AND BF_PRODUTO IS NULL


--010101	012040         	03	ZZZ	999	733935    	0,29	0,0097	13665
--010101	012040         	03	ZZZ	999	733935    	5,07	0,169	13665

--######################
--INSERE NOS SALDOS INICIAIS DOS ENDERE�OS

--BEGIN TRANSACTION INSERT INTO SBK010 (BK_FILIAL,BK_COD,BK_LOCAL,BK_DATA,BK_QINI,BK_QISEGUM,BK_LOTECTL,BK_PRIOR,BK_LOCALIZ,R_E_C_N_O_)
SELECT 
B8_FILIAL BK_FILIAL,
B8_PRODUTO BK_COD,
B8_LOCAL BF_LOCAL,
'' BK_DATA,
B8_SALDO BK_QINI,
B8_SALDO2 BK_QISEGUM,
B8_LOTECTL BK_LOTECTL,
'ZZZ' BK_PRIOR,
'999' BK_LOCALIZ,
(SELECT ISNULL(MAX(R_E_C_N_O_),0) FROM SBK010)+ rank() OVER (ORDER BY B8_FILIAL, B8_LOCAL, B8_PRODUTO, B8_LOTECTL) R_E_C_N_O_
FROM SB8010 SB8
LEFT JOIN SBF010 SBF ON BF_FILIAL= B8_FILIAL AND BF_LOTECTL= B8_LOTECTL AND BF_PRODUTO=B8_PRODUTO AND SBF.D_E_L_E_T_=''
WHERE B8_FILIAL='010101'
--AND B8_PRODUTO='000757'
--AND B8_PRODUTO IN (
--'000757',         
--'005406',         
--'006455',         
--'007516',         
--'008938') 
AND B8_SALDO >0
AND SB8.D_E_L_E_T_=''
AND BF_PRODUTO IS NULL
and B8_PRODUTO<>'006582'


--select * from SBE010
--where BE_FILIAL='010101'
--AND D_E_L_E_T_=''


SELECT B1_RASTRO,B1_LOCALIZ, * 
--BEGIN TRANSACTION UPDATE SB1 SET B1_LOCALIZ='S'
FROM SB1010 SB1
WHERE B1_FILIAL='010101'
--AND B1_COD IN ('000757',         
--'005406',         
--'006455',         
--'007516',         
--'008938') 
and B1_RASTRO='L'
--AND B1_LOCALIZ<>'S'
AND D_E_L_E_T_=''



select * from SBF010
where 1=1
and BF_PRODUTO='028604'
--AND BF_LOTECTL='154678'
ORDER BY BF_PRODUTO


select * 
--BEGIN TRANSACTION UPDATE SB8 SET D_E_L_E_T_='*', R_E_C_D_E_L_=R_E_C_N_O_
FROM SB8010 SB8
WHERE R_E_C_N_O_='62268'



--select * INTO SBF010_BKP_20210525 from SBF010
--select * INTO SBK010_BKP_20210525 from SBK010
--select * INTO SB8010_BKP_20210525 from SB8010
