SELECT '099748' UA_VEND,(
SELECT 
COUNT(DISTINCT UA_NUM)
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND UA_OPER='1'
AND SC6.D_E_L_E_T_=''
AND SUA.D_E_L_E_T_=''
)PEDIDOS,
(SELECT 
SUM(C6_VALOR)
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND UA_OPER='1'
AND SC6.D_E_L_E_T_=''
AND SUA.D_E_L_E_T_=''
)TOTAL_PEDIDOS,

(SELECT 
COUNT(DISTINCT UA_NUM)
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND UA_OPER='2'
AND SUA.D_E_L_E_T_=''
)ORÇAMENTOS,
(SELECT 
COUNT(DISTINCT UA_NUM)
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND UA_OPER='3'
AND SUA.D_E_L_E_T_=''
)ATENDIMENTOS,
(SELECT COUNT(DISTINCT UA_NUM) 
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND SUA.D_E_L_E_T_=''
AND UA_MIDIA ='000001'
)EMAIL,
(SELECT COUNT(DISTINCT UA_NUM) 
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND SUA.D_E_L_E_T_=''
AND UA_MIDIA ='000002'
)TELEFONE,
(SELECT COUNT(DISTINCT UA_NUM) 
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND SUA.D_E_L_E_T_=''
AND UA_MIDIA ='000003'
)WHATSAPP,
(SELECT COUNT(DISTINCT UA_NUM) 
FROM SUA010 SUA(NOLOCK)
LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
WHERE 1=1
AND UA_VEND ='099748'
AND UA_EMISSAO BETWEEN '20200801' AND '20200831'
AND SUA.D_E_L_E_T_=''
AND UA_MIDIA =''
)SEM_MIDIA
