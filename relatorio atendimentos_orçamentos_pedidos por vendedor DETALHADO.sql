

SELECT * FROM (
select




CASE WHEN UA_FILIAL ='010101' THEN 'TEGAPE'
     WHEN UA_FILIAL ='010102' THEN 'TEGAPE COLOMBO'
	 WHEN UA_FILIAL ='020101' THEN 'PROCESSO INDUSTRIAL'
	 WHEN UA_FILIAL ='030101' THEN 'TEGAPE QUIMICA'
	 WHEN UA_FILIAL ='030102' THEN 'TEGAPE QUIMICA CGS'
	 END EMPRESA,
UA_FILIAL,UA_VEND,A3_NOME,	
(
SELECT 
SUM(C6_VALOR)
 FROM SC5010 SC5 (NOLOCK)
 JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C6_NUM =C5_NUM AND SC5.D_E_L_E_T_='' AND SC6.D_E_L_E_T_=''
 WHERE 1=1
	AND C5_FILIAL = UA_FILIAL
	--AND UA_NUMSC5=C5_NUM
	AND C5_VEND1=UA_VEND
	AND C5_EMISSAO BETWEEN '20200801' AND '20200831'
	--GROUP BY C5_FILIAL
)TOTAL_PEDIDOS2,	
(SELECT COUNT(DISTINCT C5_NUM) QTD_PEDIDOS
 FROM SC5010 SC5 (NOLOCK)
 WHERE 1=1
	AND C5_FILIAL = UA_FILIAL
	--AND UA_NUMSC5=C5_NUM
	AND C5_VEND1='099748'
	AND C5_EMISSAO BETWEEN '20200801' AND '20200831'
	AND D_E_L_E_T_=''
)QTD_PEDIDOS,
SUM(TOTAL_PEDIDOS)TOTAL_PEDIDOS,	
COUNT(DISTINCT PEDIDOS)PEDIDOS,
COUNT(DISTINCT ORÇAMENTOS)ORÇAMENTOS,	
COUNT(DISTINCT ATENDIMENTOS)ATENDIMENTOS,	
COUNT(DISTINCT EMAIL)EMAIL,	
COUNT(DISTINCT TELEFONE)TELEFONE,	
COUNT(DISTINCT WHATSAPP)WHATSAPP,	
COUNT(DISTINCT SEM_MIDIA)SEM_MIDIA
--,UA_NUMSC5,
--UA_NUM
FROM(
		SELECT UA_FILIAL,UA_VEND, A3_NOME,	
		CASE WHEN UA_OPER ='1' AND SC6_DELET='' THEN C6_VALOR ELSE 0 END TOTAL_PEDIDOS,
		CASE WHEN UA_OPER ='1' THEN UA_NUM  END PEDIDOS,
		CASE WHEN UA_OPER ='2' THEN UA_NUM  END ORÇAMENTOS,
		CASE WHEN UA_OPER ='3' THEN UA_NUM END ATENDIMENTOS,
		CASE WHEN UA_MIDIA ='000001'  AND UA_OPER ='3' THEN UA_NUM  END EMAIL,	
		CASE WHEN UA_MIDIA ='000002'  AND UA_OPER ='3' THEN UA_NUM  END TELEFONE,	
		CASE WHEN UA_MIDIA ='000003'  AND UA_OPER ='3' THEN UA_NUM END WHATSAPP,	
		CASE WHEN UA_MIDIA =''  AND UA_OPER ='3' THEN UA_NUM  END SEM_MIDIA,
		UA_MIDIA
		--,UA_NUMSC5,UA_NUM
		FROM(
			SELECT UA_FILIAL, UA_VEND, A3_NOME,UA_NUM,UA_EMISSAO,UA_OPER,UA_MIDIA,ISNULL(C6_VALOR,0)C6_VALOR,SC6.D_E_L_E_T_ SC6_DELET 
			--,UA_NUMSC5
			FROM SUA010 SUA(NOLOCK)
			JOIN SA3010 SA3 (NOLOCK)ON LEFT(UA_FILIAL,4) = A3_FILIAL AND A3_COD =UA_VEND AND SA3.D_E_L_E_T_=''
			LEFT JOIN SC5010 SC5 (NOLOCK) ON UA_FILIAL = C5_FILIAL AND UA_NUMSC5=C5_NUM 
			LEFT JOIN SC6010 SC6 (NOLOCK) ON C5_FILIAL=C6_FILIAL AND C5_NUM=C6_NUM AND SC5.D_E_L_E_T_=''
			WHERE 1=1
			AND UA_FILIAL >=''
			AND UA_FILIAL <='ZZZZZZ'
			AND UA_VEND >=''
			AND UA_VEND <='ZZZZZZ'
			AND UA_EMISSAO >= '20200801' 
			AND UA_EMISSAO <= '20200831'
			AND SUA.D_E_L_E_T_=''
			)AA
	)BB
GROUP BY UA_FILIAL,UA_VEND,A3_NOME--,UA_NUMSC5,UA_NUM
)CC
WHERE TOTAL_PEDIDOS2<>TOTAL_PEDIDOS
--AND UA_FILIAL='010101'

ORDER BY A3_NOME
