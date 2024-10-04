 

select U5_FILIAL as Filial, 
	UA_NUM as Atendimento, UA_VEND as Vendedor, 
	UA_OPERADO as Operador, A3_NOME as Nome, 
	U5_CODCONT as Cod_Contato, U5_CONTAT as Nome_COntat, 
	U5_DDD as DDD, U5_CELULAR as Celular, 
	U5_FCOM1 as Fone_Comercial, U5_EMAIL as Email, 
	CONVERT(VARCHAR(10),CONVERT(DATE,U5_ULTCONT,103),103) as Ult_Contato 
	FROM SU5010 
	inner join SUA010 ON U5_CODCONT = UA_CODCONT AND U5_FILIAL = LEFT(UA_FILIAL,4)

	INNER JOIN SA3010 ON UA_VEND = A3_COD AND A3_FILIAL = LEFT(UA_FILIAL,4)

	WHERE U5_FILIAL = '0301' and U5_CONTAT like '%XXX%'


