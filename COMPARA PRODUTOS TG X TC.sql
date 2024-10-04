--COMPARA PRODUTOS TG X TC
SELECT --COUNT(SB1A.B1_COD),COUNT(SB1B.B1_COD)
CASE WHEN ISNULL(SB1A.B1_COD,'')<>'' THEN SB1A.B1_COD ELSE SB1B.B1_COD END CODIGO,
ISNULL(SB1A.B1_COD,'') COD_TG, ISNULL(SB1A.B1_DESC,'') DESC_TG, ISNULL(SB1B.B1_COD,'') COD_TC,  ISNULL(SB1B.B1_DESC,'') DESC_TC,
ISNULL(SUM(SB2A.B2_QATU),0) SALDO_TG,ISNULL(SUM(SB2B.B2_QATU),0) SALDO_TC,
CASE WHEN SB1A.B1_COD=SB1B.B1_COD AND SB1A.B1_DESC= SB1B.B1_DESC THEN 'TG=TC'
	 WHEN ISNULL(SB1A.B1_COD,'')<>'' AND ISNULL(SB1B.B1_COD,'')<>'' THEN 'TG<>TC'
	 WHEN ISNULL(SB1A.B1_COD,'')<>'' AND ISNULL(SB1B.B1_COD,'')='' THEN 'TG'
	 WHEN ISNULL(SB1A.B1_COD,'')='' AND ISNULL(SB1B.B1_COD,'')<>'' THEN 'TC'
ELSE ''
END VLD_PROD
FROM SB1010 SB1B
FULL JOIN SB1010 SB1A (NOLOCK) ON  SB1B.B1_FILIAL='010102' AND SB1B.B1_COD= SB1A.B1_COD AND SB1A.B1_FILIAL='010101'
LEFT JOIN SB2010 SB2A (NOLOCK) ON  SB2A.B2_FILIAL=SB1A.B1_FILIAL AND SB2A.B2_COD= SB1A.B1_COD AND SB2A.D_E_L_E_T_=''AND SB2A.B2_QATU>0
LEFT JOIN SB2010 SB2B (NOLOCK) ON  SB2B.B2_FILIAL=SB1B.B1_FILIAL AND SB2B.B2_COD= SB1B.B1_COD AND SB2B.D_E_L_E_T_=''AND SB2B.B2_QATU>0
WHERE 1=1
AND (SB1A.B1_FILIAL IS NULL OR SB1A.B1_FILIAL ='010101')
AND (SB1B.B1_FILIAL IS NULL OR SB1B.B1_FILIAL ='010102')
AND (SB1A.D_E_L_E_T_ IS NULL OR SB1A.D_E_L_E_T_='')
AND (SB1B.D_E_L_E_T_ IS NULL OR SB1B.D_E_L_E_T_='')
GROUP BY SB1A.B1_COD , SB1A.B1_DESC , SB1B.B1_COD ,  SB1B.B1_DESC 
ORDER BY 1

