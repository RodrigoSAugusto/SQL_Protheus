


SELECT UA_STATUS,
UA_NUM OR�AMENTO 
, convert(varchar(10),convert(date,UA_EMISSAO,103),103) AS DATA_EMISSAO
, ISNULL(UB_ITEM,'') ITEM
,UA_NUMSC5 PEDIDO
,UA_DOC NOTA_FIACAL
,CASE
WHEN UA_OPER = '3' THEN 'ATENDIMENTO'
WHEN UA_OPER = '2' THEN 'OR�AMENTO'
WHEN UA_OPER = '1' THEN 'PEDIDO' END STATUS
,UA_CLIENTE CLIENTE
, UA_LOJA LOJA
,CASE
WHEN UA_PROSPEC = 'F' THEN A1_NOME ELSE US_NOME END NOME_CLIENTE
, ISNULL(UB_PRODUTO,'') PRODUTO
, ISNULL(UB_XDESNFE,'') DESCRICAO_PRODUTO
, ISNULL(UB_VLRITEM,'') VAL_MERC
, 'QFACIL' SALA
, UA_VEND
, A3_NOME
FROM SUA010 (NOLOCK) UA 
INNER JOIN SA3010 (NOLOCK) A3 ON A3_FILIAL = LEFT(UA_FILIAL,4) AND  A3_COD = UA_VEND
LEFT OUTER JOIN SA1010 (NOLOCK) A1 ON A1_FILIAL = LEFT(UA_FILIAL,4) AND A1_COD = UA_CLIENTE AND A1_LOJA = UA_LOJA
LEFT OUTER JOIN SUS010 (NOLOCK) US ON US_FILIAL = LEFT(UA_FILIAL,4) AND US_COD = UA_CLIENTE AND US_LOJA = UA_LOJA
LEFT OUTER JOIN SUB010 (NOLOCK) UB ON UB_FILIAL = UA_FILIAL AND UB_NUM = UA_NUM 
WHERE UA_FILIAL = '010106' 
AND UA_EMISSAO BETWEEN '20240906' AND '20240926' 
AND UA.D_E_L_E_T_ = ''
ORDER BY A3_NOME







