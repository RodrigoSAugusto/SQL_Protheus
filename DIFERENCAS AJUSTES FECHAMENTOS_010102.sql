SELECT D3_COD, B1_DESC, B1_TIPO, B1_GRUPO, B1_LOCPAD
,SUM(A_D3_QUANT) QTD_SAIDA
,SUM(B_D3_QUANT) QTD_ENTRADA
--,SUM(B_D3_QUANT)-SUM(A_D3_QUANT) DIFEREN�A
FROM (
SELECT 
CASE WHEN A_D3_COD IS NOT NULL THEN A_D3_COD
	ELSE B_D3_COD
	END D3_COD
,CASE WHEN A_D3_NUMSEQ IS NOT NULL THEN A_D3_NUMSEQ
	ELSE B_D3_NUMSEQ
	END D3_NUMSEQ
,*
FROM (
SELECT A.D3_FILIAL	A_D3_FILIAL 
,A.D3_TM			A_D3_TM
,A.D3_COD			A_D3_COD
,A.D3_UM			A_D3_UM
,ISNULL(A.D3_QUANT,0)			A_D3_QUANT
,A.D3_CF			A_D3_CF
,A.D3_LOCAL			A_D3_LOCAL
,A.D3_EMISSAO		A_D3_EMISSAO
,A.D3_CUSTO1		A_D3_CUSTO1
,A.D3_NUMSEQ		A_D3_NUMSEQ
,A.D3_TIPO			A_D3_TIPO
,A.D3_USUARIO		A_D3_USUARIO
,A.R_E_C_N_O_		A_R_E_C_N_O_

,B.D3_FILIAL  B_D3_FILIAL 
,B.D3_TM	  B_D3_TM
,B.D3_COD	  B_D3_COD
,B.D3_UM	  B_D3_UM
,ISNULL(B.D3_QUANT,0)	  B_D3_QUANT
,B.D3_CF	  B_D3_CF
,B.D3_LOCAL	  B_D3_LOCAL
,B.D3_EMISSAO B_D3_EMISSAO
,B.D3_CUSTO1  B_D3_CUSTO1
,B.D3_NUMSEQ  B_D3_NUMSEQ
,B.D3_TIPO	  B_D3_TIPO
,B.D3_USUARIO B_D3_USUARIO
,B.R_E_C_N_O_ B_R_E_C_N_O_
--,*
FROM SD3010 A (NOLOCK)
FULL OUTER JOIN SD3010 B (NOLOCK) ON (B.D3_NUMSEQ = A.D3_NUMSEQ AND B.D3_CF <> A.D3_CF AND B.D_E_L_E_T_ = '' AND A.D_E_L_E_T_ = '' AND B.D3_FILIAL =A.D3_FILIAL)
WHERE 1=1
AND (A.D3_FILIAL='020101' OR B.D3_FILIAL='020101')
AND (A.D_E_L_E_T_ = '' OR B.D_E_L_E_T_ = '')
AND (A.D3_EMISSAO<='20210101' OR B.D3_EMISSAO<='20210101')
AND (A.D3_CF='RE0' OR B.D3_CF='DE0' )
--AND (A.D3_ESTORNO <>'S' OR B.D3_ESTORNO<>'S')
AND (A.R_E_C_N_O_>'481549' OR B.R_E_C_N_O_>'481549')
)AA
)BB
JOIN SB1010 SB1 ON SB1.B1_FILIAL='020101' AND B1_COD = D3_COD AND SB1.D_E_L_E_T_=''
--where D3_COD='005088'
GROUP BY D3_COD, B1_DESC, B1_TIPO, B1_GRUPO,B1_LOCPAD


--SELECT * FROM SD3010
--WHERE 1=1
--AND D3_EMISSAO<='20210101'
--AND D3_FILIAL='020101'
--AND R_E_C_N_O_ >'481549'
--AND D_E_L_E_T_=''
 

