SELECT VEND.MES,	VEND.QUANTIDADE QTD_VEND, DEV.QUANTIDADE QTD_DEV
 FROM(
	--NF DEVOLU��O
	SELECT 
	SUBSTRING(F1_DTDIGIT,0,7) MES,
	COUNT (F1_DOC) QUANTIDADE
	--SELECT F1_DOC, F1_DTDIGIT,SUBSTRING(F1_DTDIGIT,0,7),* 
	FROM SF1010 SF1
	WHERE 1=1
	AND F1_FILIAL='010101'
	AND F1_TIPO= 'D'
	AND F1_DTDIGIT BETWEEN '20210101' AND '20211231'
	AND SF1.D_E_L_E_T_=''
	GROUP BY SUBSTRING(F1_DTDIGIT,0,7)
)DEV
JOIN (
	--NF VENDA
	SELECT 
	SUBSTRING(D2_EMISSAO,0,7)MES,COUNT (DISTINCT D2_DOC)QUANTIDADE
	--D2_DOC, D2_EMISSAO,SUBSTRING(D2_EMISSAO,0,7),*
	--D2_TIPO,F4_DUPLIC,D2_EMISSAO, D2_DOC,* 
	FROM SD2010 SD2 (NOLOCK)
	JOIN SF4010 SF4 (NOLOCK) ON F4_CODIGO=D2_TES AND SF4.D_E_L_E_T_=''
	WHERE 1=1
	AND D2_FILIAL ='010101'
	AND D2_TIPO='N'
	AND F4_DUPLIC='S'
	AND D2_EMISSAO BETWEEN '20210101' AND '20211231'
	GROUP BY SUBSTRING(D2_EMISSAO,0,7)
)VEND ON VEND.MES=DEV.MES
