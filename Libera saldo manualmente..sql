select * from SB2010 where B2_COD = '009255'

select * from SB8010 where B8_PRODUTO = '009255' and B8_SALDO <> '0'

select * from SC9010 where C9_PEDIDO = '073282' and C9_FILIAL = '010101' and D_E_L_E_T_ = ''

--begin transaction 
--update SC9010 SET C9_BLEST = '', C9_LOTECTL = '0001360985' 
	WHERE C9_FILIAL = '010101'
		AND C9_PEDIDO = '073282'
		AND C9_PRODUTO = '035931'
		AND D_E_L_E_T_ = ''

--ROLLBACK
--COMMIT