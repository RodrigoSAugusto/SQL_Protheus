---------------------------------------------------------------------
-- Seleciona Clientes por estado e filtra aqueles com a ultima compra
-- anterior a data especificada no "D2_DTDIGIT <="
---------------------------------------------------------------------

SELECT distinct A1_COD, A1_LOJA, A1_NOME, A1_MUN, A1_EST
	FROM SA1010 SA1
		INNER JOIN SD2010 ON 1=1 
		AND A1_FILIAL = left(D2_FILIAL,4) 
		AND A1_COD = D2_CLIENTE
		WHERE D2_DTDIGIT <= '20220530'
		AND A1_EST = 'RJ' 
	  --AND A1_MUN IN ('CRICIUMA', 'URUSSANGA') 
		AND A1_FILIAL = '0101'
	ORDER BY A1_MUN


