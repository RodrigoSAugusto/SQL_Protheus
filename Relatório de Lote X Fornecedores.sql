






SELECT * FROM SDC010 WHERE DC_LOTECTL = '001232361R'

SELECT * FROM SB8010 WHERE B8_LOTECTL = '1383463A' AND B8_PRODUTO = '037469'

SELECT * FROM SD5010 WHERE D5_LOTECTL = '001232361R' AND D5_ORIGLAN <= '499'

SELECT * FROM SD1010 WHERE D1_NUMSEQ = '99W78G'

SELECT D2_NFORI, * FROM SD2010 WHERE D2_NUMSEQ = '99W78G'

SELECT  * FROM SD3010 WHERE D3_NUMSEQ = '99W78G'

SELECT * FROM SC6010 WHERE C6_FILIAL = '010101' and C6_NUM = '080042' 

SELECT * FROM SC5010 where C5_NUM = '080014'

SELECT * FROM SA1010 WHERE A1_COD = '103624'

-- PESQUISA PRINCIPAL POR PEDIDO DE VENDA.
	SELECT DISTINCT
		C5_FILIAL, C5_NUM, C5_NOTA,
		C6_ITEM, C5_CLIENTE,
		D5_LOTECTL,	D5_NUMSEQ, B8_PRODUTO, D5_QUANT, B8_QTDORI,
		B8_DOC,	B8_LOTECTL,	
		D1_DOC,	D5_OP
		FROM SC5010 INNER JOIN SD5010
			ON 1=1	AND C5_NOTA = D5_DOC
			LEFT OUTER JOIN SB8010 ON 1=1 
				AND D5_FILIAL = B8_FILIAL
				AND D5_LOTECTL = B8_LOTECTL
			LEFT OUTER JOIN SDC010 ON 1=1 
				AND D5_FILIAL = DC_FILIAL
				AND C5_NUM = DC_PEDIDO
			LEFT OUTER JOIN SD1010 ON 1=1
				AND D1_FILIAL = B8_FILIAL
				AND D1_DOC = B8_DOC
			LEFT OUTER JOIN SC6010 ON 1=1
				AND C6_FILIAL = C5_FILIAL
				AND C6_NUM = C5_NUM
				AND C6_PRODUTO = B8_PRODUTO
			WHERE	C5_NUM = '080036'
					AND D5_FILIAL = '010101'
					AND D5_ORIGLAN >= '499' 
					AND D5_ESTORNO <> 'S'
					AND C6_ITEM <> ''
			ORDER BY C6_ITEM

-- PESQUISA PADR�O POR DESMONTAGEM.
	SELECT	DISTINCT TOP 1
			D1_COD,
			D1_FORNECE,
			D1_LOTECTL,
			A2_NREDUZ,
			D5_DATA
		FROM SD5010	SD5
			LEFT OUTER JOIN SB8010 ON 1=1 
				AND D5_FILIAL = B8_FILIAL
				AND D5_LOTECTL = B8_LOTECTL
			LEFT OUTER JOIN SD1010 ON 1=1
				AND D1_COD = B8_PRODUTO
				AND B8_DOC = D1_DOC
			LEFT OUTER JOIN SA2010 ON 1=1
				AND D1_FORNECE = A2_COD
			WHERE	D1_DOC = '000341262'
					AND D5_FILIAL = '010101'
					AND D5_ORIGLAN <= '499' 
					AND D5_ESTORNO <> 'S'
			ORDER BY D5_DATA DESC
			


-- PESQUISA CASO SEJA UM LOTE DE OP.
	SELECT	DISTINCT 
			D1_COD,
			D1_FORNECE,
			D1_LOTECTL,
			A2_NREDUZ,
			D5_OP,
			D1_NFORI
		FROM SD5010	SD5
			LEFT OUTER JOIN SB8010 ON 1=1 
				AND D5_FILIAL = B8_FILIAL
				AND D5_LOTECTL = B8_LOTECTL
			LEFT OUTER JOIN SDC010 ON 1=1 
				AND D5_FILIAL = DC_FILIAL
				AND D5_OP = DC_OP
			LEFT OUTER JOIN SD1010 ON 1=1
				AND D1_FILIAL = DC_FILIAL
				AND D1_LOTECTL = DC_LOTECTL
			LEFT OUTER JOIN SA2010 ON 1=1
				AND D1_FORNECE = A2_COD
			WHERE D5_LOTECTL = '1383463A'
				AND D1_FILIAL = '010101'
				AND D5_ORIGLAN <= '499' 
				AND D5_ESTORNO <> 'S'


-- PESQUISA CASO SEJA UM LOTE DE DEVOLU��O.

		SELECT D1_FILIAL, D1_NFORI, D1_DOC, D5_QUANT, D5_LOTECTL,*
			FROM SD1010 
				LEFT OUTER JOIN SA2010 ON 1=1
					AND D1_FORNECE = A2_COD
				LEFT OUTER JOIN SB8010 ON 1=1
					AND D1_COD = B8_PRODUTO
					AND B8_DOC = D1_DOC
				LEFT OUTER JOIN SD5010 ON 1=1
					AND D1_NUMSEQ = D5_NUMSEQ
					AND D5_DTVALID = D1_DTVALID
			WHERE	D1_COD = '008755'
					AND D1_QUANT = '2.09'
					AND D1_FILIAL = '010101'
					AND D5_ORIGLAN <= '499'
					ORDER BY D1_ITEM DESC




select * from SC5010 where C5_NOTA = '000270559'

SELECT TOP 1
		D1_DOC,
		B8_QTDORI,
		D1_NFORI,
		D1_LOTECTL, *
		FROM SC5010 INNER JOIN SD5010
			ON 1=1	AND C5_NOTA = D5_DOC
			LEFT OUTER JOIN SB8010 ON 1=1 
				AND D5_FILIAL = B8_FILIAL
				AND D5_LOTECTL = B8_LOTECTL
			LEFT OUTER JOIN SDC010 ON 1=1 
				AND D5_FILIAL = DC_FILIAL
				AND C5_NUM = DC_PEDIDO
			LEFT OUTER JOIN SD1010 ON 1=1
				AND D1_FILIAL = B8_FILIAL
				AND D1_DOC = B8_DOC
			LEFT OUTER JOIN SC6010 ON 1=1
				AND C6_FILIAL = C5_FILIAL
				AND C6_NUM = C5_NUM
				AND C6_PRODUTO = B8_PRODUTO
			WHERE	C5_NOTA = '000353894'
					AND D5_FILIAL = '010101'
					AND D5_QUANT = '2'
					AND D5_ORIGLAN >= '499' 
					AND D5_ESTORNO <> 'S'
			ORDER BY C6_ITEM





SELECT * FROM SB1010 WHERE B1_COD  = '000758'


select * from SC5010 where C5_NUM = '083102'


select * from SC6010 where C6_NUM = '083102'


select * from ZRP010 where ZRP_NUMERO = '211510' order by ZRP_DATA


--update ZRP010 set ZRP_STATUS = 'PRP' where R_E_C_N_O_ = '120226'


SELECT * FROM SD3010 WHERE D3_DOC = '000140289'

