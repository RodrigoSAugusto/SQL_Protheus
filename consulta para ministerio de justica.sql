

SELECT 
D2_FILIAL
, D2_COD 
, B1_DESC
, D2_UM
, YEAR(D2_EMISSAO) D2_EMISSAO
, SUM(D2_QUANT) D2_QUANT 
, SUM(D2_TOTAL) D2_TOTAL   
FROM SD2010, SB1010
WHERE 1=1
AND B1_FILIAL = D2_FILIAL 
AND B1_COD = D2_COD 
AND D2_COD IN (
'012394'
)
and SB1010.D_E_L_E_T_ = '' 
and SD2010.D_E_L_E_T_ = ''
AND D2_FILIAL = '010101'
GROUP BY D2_FILIAL, D2_COD , D2_UM, B1_DESC, YEAR(D2_EMISSAO)
ORDER BY D2_FILIAL, D2_COD , YEAR(D2_EMISSAO)