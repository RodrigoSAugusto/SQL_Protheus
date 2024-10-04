SELECT 
C6_LOCAL, NNR_DESCRI,
count(distinct C6_NUM) QTD
FROM SC6010 SC6
JOIN SC5010 SC5 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
JOIN SD4010 SD4A ON SD4A.D4_FILIAL=C6_FILIAL AND SUBSTRING(SD4A.D4_OP,1,8)=C6_NUMOP+C6_ITEMOP AND SD4A.D_E_L_E_T_='' AND SD4A.D4_PRODUTO=SC6.C6_PRODUTO
JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''
FULL OUTER JOIN NNR010 NNR ON NNR_FILIAL=C6_FILIAL AND NNR_CODIGO = C6_LOCAL
WHERE 1=1
AND C6_FILIAL='020101'
AND C6_NOTA=''
AND SC6.D_E_L_E_T_=''
AND C6_QTDVEN>C6_QTDENT
AND D4_QUANT >0
AND C6_NUM='000817' 
GROUP BY C6_LOCAL,NNR_DESCRI
order by 1


SELECT 
C6_FILIAL,C6_NUM,C6_PRODUTO,
D4_OP OP,
C6_LOCAL,NNR_DESCRI, C5_EMISSAO, C6_QTDVEN VENDIDO, C6_QTDENT FATURADO,C6_QTDVEN -C6_QTDENT RESIDUO,
case when C6_NOTA <>'' then C6_NOTA else C5_NOTA end NOTA
FROM SC6010 SC6
JOIN SC5010 SC5 ON C5_FILIAL = C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
JOIN SB1010 SB1 ON B1_FILIAL=C6_FILIAL AND C6_PRODUTO = B1_COD AND SB1.D_E_L_E_T_=''
LEFT OUTER JOIN SD4010 SD4A ON SD4A.D4_FILIAL=C6_FILIAL AND SUBSTRING(SD4A.D4_OP,1,8)=C6_NUMOP+C6_ITEMOP AND SD4A.D_E_L_E_T_='' AND SD4A.D4_PRODUTO=SC6.C6_PRODUTO
LEFT OUTER JOIN NNR010 NNR ON NNR_FILIAL=C6_FILIAL AND NNR_CODIGO = C6_LOCAL
WHERE 1=1
AND C6_FILIAL='020101'
AND C6_BLQ<>'R'
AND C6_NOTA=''
AND SC6.D_E_L_E_T_=''
AND C6_QTDVEN>C6_QTDENT
--AND D4_QUANT >0
AND C6_NUM='000817' 
--and C6_LOCAL ='01'
group by C6_FILIAL,C6_NUM,C6_PRODUTO,
D4_OP,
C6_LOCAL,NNR_DESCRI,C5_EMISSAO,C5_NOTA,C6_NOTA,C6_QTDVEN, C6_QTDENT
order by 2


SELECT * FROM SC6010
WHERE C6_NUM='009913'