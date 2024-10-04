SELECT 
	 ZB_SALA, A1_FILIAL, A1_COD, A1_LOJA, A1_NOME, A1_CGC, A1_EST, 
	 A1_MUN	, A1_DDD, A1_TEL, A1_EMAIL, COD_SEGMENTO, SEGMENTO, A1_ULTCOM,A1_EST, 
	 ULT_DOC, ULT_EMISS, A1_VEND, A3_NOME, ULT_ATEND, DATA_ATEND, DATA_RETORNO
FROM (
		SELECT	ZB_SALA,A1_FILIAL, A1_COD, A1_LOJA,
				A1_NOME, A1_CGC, A1_MUN, A1_DDD,
				A1_TEL, A1_EMAIL, A1_VEND,  A3_NOME, A1_ULTCOM,
				A1_EST, F2_FILIAL, F2_CLIENTE, F2_LOJA, 
				MAX(F2_EMISSAO)ULT_EMISS, MAX(F2_DOC) ULT_DOC 
			FROM SA1010 SA1 (NOLOCK)
			left JOIN SF2010 SF2 (NOLOCK) ON (A1_FILIAL=SUBSTRING(F2_FILIAL,1,4) AND A1_COD=F2_CLIENTE AND A1_LOJA=F2_LOJA AND SA1.D_E_L_E_T_='' )
			LEFT JOIN SA3010 SA3 (NOLOCK) ON (A3_FILIAL = SA1.A1_FILIAL AND SA3.A3_COD = SA1.A1_VEND  AND SA3.D_E_L_E_T_ = ' '  )
			LEFT JOIN SZB010 SZB ON ZB_FILIAL=A3_FILIAL AND ZB_CODVEND=A3_COD AND SZB.D_E_L_E_T_=''
				WHERE 1=1
				--AND F2_FILIAL='020101'
				AND (F2_FILIAL='010101' OR F2_FILIAL IS NULL )
				AND A1_FILIAL='0101'
				AND A1_MSBLQL='2'
				AND SA1.D_E_L_E_T_=''
				--AND F2_CLIENTE='003202'
				--AND F2_TIPO='N'
				--AND F2_EMISSAO >='20211101'
				--AND A1_ULTCOM >= '20210101'
				--AND A1_ULTCOM <= '20210131'
				--AND A1_EST = 'BA'
				--and F2_TIPO not in ('B','D')
				AND (SF2.D_E_L_E_T_='' or SF2.D_E_L_E_T_ IS NULL)
		GROUP BY ZB_SALA, F2_FILIAL, F2_CLIENTE, F2_LOJA, A1_FILIAL, A1_COD, A1_LOJA, A1_NOME, A1_CGC, A1_EST, A1_MUN, A1_DDD, A1_TEL, A1_EMAIL,  A1_VEND, A3_NOME, A1_ULTCOM, A1_CODSEG--, AOV_DESSEG 
	)TEMP
	LEFT JOIN (select * from V_CLIENTE_ATEND)V ON FILIAL=SUBSTRING(F2_FILIAL,1,4) 
	AND TIPO='CLIENTE' AND CLIENTE=F2_CLIENTE AND LOJA=F2_LOJA
where 1=1
AND A1_ULTCOM <= DATEADD(MONTH,-3,CONVERT(DATE,GETDATE(),112))
--AND A1_COD = '003202'
--AND A1_COD='019343'
--AND A1_COD='028040'
AND A1_EST='PR'

ORDER BY A1_ULTCOM




SELECT                                                                                                                                          
 D2_FILIAL,UA_NUM,D2_PEDIDO, D2_EMISSAO,                                                                                                        
 D2_DOC,D2_ITEM,D2_CLIENTE,D2_LOJA,D2_COD,C6_DESCRI,D2_TES,F4_TEXTO,D2_QUANT,D2_PRCVEN,D2_TOTAL,UA_OPERADO,U7_NOME,C5_VEND1,A3_NOME,ZB_SALA     
 from SD2010 SD2 (NOLOCK)                                                                                                                       
 JOIN SC6010 SC6 (NOLOCK) ON C6_FILIAL=D2_FILIAL AND D2_PEDIDO = C6_NUM AND D2_COD=C6_PRODUTO                                                   
 JOIN SC5010 SC5 (NOLOCK) ON C5_FILIAL=D2_FILIAL AND D2_PEDIDO = C5_NUM AND SC5.D_E_L_E_T_=''                                                   
 LEFT JOIN SA3010 SA3 (NOLOCK) ON A3_FILIAL =SUBSTRING(C5_FILIAL,1,4) AND SA3.D_E_L_E_T_='' AND A3_COD=C5_VEND1                                 
 LEFT JOIN SUA010 SUA (NOLOCK) ON UA_FILIAL=C5_FILIAL AND UA_NUMSC5=C5_NUM AND SUA.D_E_L_E_T_=''                                                
 LEFT JOIN SU7010 SU7 (NOLOCK) ON U7_FILIAL=UA_FILIAL AND U7_COD=UA_OPERADO                                                                     
 LEFT JOIN SZB010 SZB (NOLOCK) ON ZB_FILIAL=A3_FILIAL AND ZB_CODVEND=A3_COD AND SZB.D_E_L_E_T_=''                                               
 LEFT JOIN SF4010 SF4 (NOLOCK) ON F4_CODIGO= D2_TES AND SF4.D_E_L_E_T_=''                                                                       
 WHERE D2_FILIAL LIKE CONCAT(SUBSTRING('020101',1,4),'%')                                                                                                                       
 AND D2_CLIENTE='028040'                                                                                                                        
 AND D2_LOJA='0001'  
ORDER BY SD2.R_E_C_N_O_
	--UA_FILIAL,	UA_NUM,	UA_NUMSC5,	UA_DOC,																																																										  "	+ CRLF
	--UA_EMISSAO,	UA_CLIENTE,	UA_LOJA,	NOMECLI,																																
	--TIPOCLI,	UA_VALMERC,	UA_VLRLIQ,	UA_VEND,
	--UA_CODOBS,	A3_NOME,	UA_OPERADO,UA_CODCANC,	
	--U7_NOME,UB_ITEM,UB_PRODUTO,UB_VLRITEM,UB_XDESNFE,ZB_SALA

	--SELECT * FROM SC6010

	--SELECT * FROM SA3010
	--WHERE A3_COD='000008'
	--AND A3_FILIAL='0201  '

	--SELECT * FROM SZB010

	--select * from SD2010



