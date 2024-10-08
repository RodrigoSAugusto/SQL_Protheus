
--###########################################################
--#1 VALIDA icms dif e vopdif

select  
sum(D1_ICMSDIF)D1_ICMSDIF,
sum(D1_VOPDIF)D1_VOPDIF,
sum(D1_VALICM)D1_VALICM,
sum(FT_ICMSDIF)FT_ICMSDIF,
sum(FT_VOPDIF)FT_VOPDIF,
sum(FT_VALICM)FT_VALICM,	
sum(VOP_icms)VOP_icms,	
sum(CALC_icmsdif)CALC_icmsdif,
sum(CALC_VALICM)CALC_VALICM
--SELECT *
from (
select 
FT_BASEICM,D1_ICMSDIF,D1_VOPDIF,D1_VALICM, FT_ICMSDIF,FT_VOPDIF,FT_VALICM
,round(FT_BASEICM * 0.18,2) VOP_icms
,ROUND ((FT_BASEICM * 0.18) * 0.6667,2)CALC_icmsdif
,ROUND((FT_BASEICM * 0.18)- ((FT_BASEICM * 0.18) * 0.6667) ,2)CALC_VALICM
,D1_FILIAL,D1_ITEM,D1_COD,D1_QUANT,D1_VUNIT,D1_TOTAL,D1_PEDIDO,D1_ITEMPC,D1_FORNECE,D1_LOJA,D1_LOCAL,D1_DOC
from SD1010 SD1 (NOLOCK)
JOIN SFT010 SFT (NOLOCK) ON FT_FILIAL=D1_FILIAL AND FT_NFISCAL=D1_DOC AND FT_CLIEFOR=D1_FORNECE AND  D1_COD =FT_PRODUTO AND SFT.D_E_L_E_T_='' AND SD1.D_E_L_E_T_=''
WHERE D1_DOC LIKE '%000337127'
AND D1_FORNECE LIKE'%108697%'
AND SFT.D_E_L_E_T_=''
)aaa
where 1=1
AND FT_VOPDIF<>VOP_icms
or CALC_icmsdif <>FT_ICMSDIF OR CALC_VALICM<>FT_VALICM


--###########################################################
--#2 corrige icms dif e vopdif NAS TABELAS DOS ITENS


--

select  
sum(D1_ICMSDIF)D1_ICMSDIF,
sum(D1_VOPDIF)D1_VOPDIF,
sum(D1_VALICM)D1_VALICM,
D1_DOC
FROM SD1010
WHERE D1_DOC  LIKE '%000337127'
AND D1_FILIAL = '010101'
AND D1_FORNECE LIKE'%108697%'
AND D_E_L_E_T_=''
--AND D1_ITEM='0030'
GROUP BY D1_DOC

--BEGIN TRAN
--ROUND((FT_BASEICM * 0.18),2)
	SELECT ROUND ((FT_BASEICM * 0.18) * 0.6667,2) ICMSDIF,FT_ICMSDIF,ROUND((FT_BASEICM * 0.18),2)ICMSOP,FT_VOPDIF,ROUND((FT_BASEICM * 0.18)- ((FT_BASEICM * 0.18) * 0.6667) ,2)VALICM,FT_VALICM,* FROM SFT010
   --begin transaction UPDATE SFT010 SET FT_ICMSDIF = ROUND ((FT_BASEICM * 0.18) * 0.6667,2),FT_VOPDIF = ROUND((FT_BASEICM * 0.18),2), FT_VALICM=ROUND((FT_BASEICM * 0.18)- ((FT_BASEICM * 0.18) * 0.6667) ,2)
 WHERE FT_NFISCAL LIKE '%000337127'
   AND FT_FILIAL = '010101'
   AND FT_CLIEFOR LIKE'%108697%'

   SELECT ROUND ((D1_BASEICM * 0.18) * 0.6667,2),D1_ICMSDIF, ROUND((D1_BASEICM * 0.18),2),D1_VOPDIF,D1_VALICM,ROUND((D1_BASEICM * 0.18)- ((D1_BASEICM * 0.18) * 0.6667) ,2),* FROM SD1010    
   --begin transaction UPDATE SD1010    SET D1_ICMSDIF = ROUND ((D1_BASEICM * 0.18) * 0.6667,2), D1_VOPDIF=(D1_BASEICM * 0.18), D1_VALICM=ROUND((D1_BASEICM * 0.18)- ((D1_BASEICM * 0.18) * 0.6667) ,2)
 WHERE D1_DOC  LIKE '%000337127'
   AND D1_FILIAL = '010101'
	AND D1_FORNECE LIKE'%108697%'

--###########################################################
--#3 corrige icms dif e vopdif NAS TABELAS DOS CABEÇALHOS

select F1_VALICM,* 
--BEGIN TRANSACTION UPDATE SF1 SET F1_VALICM=8864.65
from SF1010 SF1
WHERE F1_DOC LIKE '%000337127'

--D1_ICMSDIF	D1_VOPDIF	D1_VALICM	D1_DOC
--17731,97	26596,6182	8864,65	000337127



SELECT F3_VALICM,F3_ICMSDIF,* 
--BEGIN TRANSACTION UPDATE SF3 SET F3_VALICM=8864.65
--BEGIN TRANSACTION UPDATE SF3 SET F3_ICMSDIF=17731.97
FROM SF3010 SF3
WHERE F3_NFISCAL LIKE '%000337127'

--###########################################################
--#4 DELETA NF DO TSS PARA PODER TRANSMITIR NOVAMENTE

SELECT D_E_L_E_T_,
CONVERT(varchar(MAX),CONVERT(VARBINARY(MAX), XML_ERP)) as XML_ERP2,
* 
--BEGIN TRANSACTION UPDATE SPED SET D_E_L_E_T_ ='*', 	R_E_C_D_E_L_ =R_E_C_N_O_
 
FROM tss_nfe_producao..SPED050 SPED
WHERE NFE_ID LIKE'%000333270%'

--MENSAGENS DA NF(PARA VER QUAL O ERRO DA TRANSMISSAO)
select *
FROM tss_nfe_producao..SPED054 S54
WHERE NFE_ID LIKE'%000333269%'

--COMMIT
--ROLLBACK

--D1_ICMSDIF	D1_VOPDIF	D1_VALICM	D1_DOC
--145007,19		217499,9328	72492,74	000308174

--Valor do ICMS Diferido no CST=51 difere do produto Valor ICMS Operacao e percentual diferimento 
--[nItem:1, vICMSDif informado: 9793.6000, vICMSDif calculado: 9794.0897]