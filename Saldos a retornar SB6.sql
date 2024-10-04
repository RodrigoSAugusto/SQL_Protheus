----------------------------------------------------------
--Consulta saldos a retornar em notas de entrada parcial.
----------------------------------------------------------

SELECT	B6_DOC AS NF, 
		B6_QUANT AS QTD_RETORNADA, 
		B6_SALDO FALTA_RETORNAR
		FROM SB6010 
			WHERE 
				B6_PRODUTO = '004012' AND B6_DOC IN	('000030586', 
													 '000030521',
													 '000030166')



