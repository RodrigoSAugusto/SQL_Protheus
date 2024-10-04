select * from SH6010  where H6_OP = 'i0381N01001' and H6_FILIAL = '020101'

--begin transaction

--update SH6010 set H6_DATAINI = '20220819', H6_DATAFIN = '20220819' where H6_OP = 'i0381N01001' and H6_FILIAL = '020101' and H6_DATAINI = '20220816'

--rollback

--commit