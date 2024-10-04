-------------------------------------------------------------------------
--Insert de motivos de inatividade na ZMI010 
-------------------------------------------------------------------------
select * from ZMI010


--BEGIN TRANSACTION
INSERT INTO ZMI010 (ZMI_FILIAL, ZMI_COD, ZMI_DESCRI,  R_E_C_N_O_)
		VALUEs ('0301', '001', 'Empresa Fechou',(SELECT MAX(R_E_C_N_O_ + 1) FROM ZMI010))

INSERT INTO ZMI010 (ZMI_FILIAL, ZMI_COD, ZMI_DESCRI,  R_E_C_N_O_)
		VALUEs ('0301', '002', 'Virou Cliente', (SELECT MAX(R_E_C_N_O_ + 1) FROM ZMI010))

INSERT INTO ZMI010 (ZMI_FILIAL, ZMI_COD, ZMI_DESCRI,  R_E_C_N_O_)
		VALUES ('0301', '003', 'Deixou de Fazer o Processo', (SELECT MAX(R_E_C_N_O_ + 1) FROM ZMI010))

INSERT INTO ZMI010 (ZMI_FILIAL, ZMI_COD, ZMI_DESCRI,  R_E_C_N_O_)
		VALUES ('0301', '004', 'Número não existe, Não localizamos outro', (SELECT MAX(R_E_C_N_O_ + 1) FROM ZMI010))

INSERT INTO ZMI010 (ZMI_FILIAL, ZMI_COD, ZMI_DESCRI,  R_E_C_N_O_)
		VALUES('0301', '005', 'Inumeras tentativas, não houve retorno', (SELECT MAX(R_E_C_N_O_ + 1) FROM ZMI010))

	--	COMMIT