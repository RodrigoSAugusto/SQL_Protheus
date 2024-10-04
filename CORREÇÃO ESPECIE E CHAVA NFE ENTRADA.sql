declare @nota as varchar(9)
declare @serie as varchar(3)
declare @filial as varchar(6)
declare @Chv as varchar(44)
declare @especie as varchar(4)

set @nota = '000002382'
set @serie = '1'
set @filial = '010101'
set @chv = '42240575383687000190550010000023821830315658'
set @especie = 'SPED'

select F1_ESPECIE, F1_CHVNFE,* from SF1010 where F1_DOC = @nota AND F1_FILIAL = @filial and F1_SERIE = @serie AND D_E_L_E_T_ = ''
select FT_ESPECIE, FT_CHVNFE,* from SFT010 where FT_NFISCAL = @nota AND FT_FILIAL = @filial AND FT_SERIE = @serie AND D_E_L_E_T_ = ''
select F3_ESPECIE, F3_CHVNFE,* from SF3010 where F3_NFISCAL = @nota AND F3_FILIAL = @filial AND F3_SERIE = @serie AND D_E_L_E_T_ = ''


BEGIN TRANSACTION

UPDATE SF1010 SET F1_CHVNFE = @Chv, F1_ESPECIE = @especie where F1_DOC = @nota AND F1_FILIAL = @filial AND D_E_L_E_T_ = ''
UPDATE SFT010 SET FT_CHVNFE = @Chv, FT_ESPECIE = @especie where FT_NFISCAL = @nota AND FT_FILIAL = @filial AND D_E_L_E_T_ = ''
UPDATE SF3010 SET F3_CHVNFE = @Chv, F3_ESPECIE = @especie where F3_NFISCAL = @nota AND F3_FILIAL = @filial AND D_E_L_E_T_ = ''

COMMIT
