/*
Campo F2_FIMP – Flag de impressão (http://tdn.totvs.com/pages/viewpage.action?pageId=189317260)
“  ” - Não transmitida
S - Autorizada
T - Transmitida
D - Uso Denegado
N - Não autorizada
Campo F2_STATUS – Status Canc. NFe (registrado apenas quando se faz uso do FATJOBNFE)
“  ” - Não houve tentativa de cancelamento com uso do FATJOBNFE
015 - Cancelamento Autorizado
025 - Cancelamento não transmitido (Aguardando retorno do SEFAZ)
026 - Cancelamento não autorizado
030 - Inutilização de numeração autorizada
036 - Cancelamento autorizado fora do prazo


Campo STATUS Tabela SPED050 - Status da NFe:
 1 = NFe Recebida.
 2 = NFe Assinada.
 3 = NFe com falha no schema XML.
 4 = NFe transmitida.
 5 = NFe com problemas.
 6 = NFe autorizada.
 7 = Cancelamento


Campo STATUSCANC Tabela SPED050 -  Status Cancelamento/inutilização ():
 1 = NFe Recebida.
 2 = NFe Cancelada.
 3 = NFe com falha de cancelamento/inutilização.


Tabelas de Serviço/Prefeitura

Campo STATUS Tabela SPED051 - Status NFSE
STATUS= 1 "Nfse recebida pelo TSS"STATUS= 2 "Nfse assinada"
STATUS= 3 "Nfse com erro de schema"
STATUS= 4 "Nfse transmitida"
STATUS= 5 "Nfse rejeitada"
STATUS= 6 "Nfse autorizada"
STATUS= 7 + STATUSCANC=2 "Nfse cancelada"
*/


--ALTERA STATUS DA NF PARA 6(NF AUTORIZADA)E STATUS DO CANCELAMENTO PARA 0
select CONVERT(varchar(MAX),CONVERT(VARBINARY(MAX), XML_ERP)) as XML_ERP2,*
--BEGIN TRANSACTION UPDATE S50 SET STATUS=6, STATUSCANC=0
FROM tss_nfe_producao..SPED050 S50
WHERE NFE_ID LIKE'%000028090%'

--EXCLUI MENSAGENS DE CANCELAMENTO DA NF DEIXANDO SOMENTE A PRIMEIRA COM "Autorizado o uso da NF-e"
select *
--BEGIN TRANSACTION UPDATE S54 SET D_E_L_E_T_ ='*', 	R_E_C_D_E_L_ =R_E_C_N_O_
FROM tss_nfe_producao..SPED054 S54
WHERE NFE_ID LIKE'%000028090%'
and R_E_C_N_O_ <>'115976'
--commit
 
 select F2_FIMP, F2_STATUS,D_E_L_E_T_,* 
--BEGIN TRANSACTION UPDATE SF2 SET F2_FIMP='S', F2_STATUS=''
from SF2010 SF2 WHERE F2_DOC ='000028090'
--F2_STATUS = '015'

select D_E_L_E_T_,* from SD2010 WHERE D2_DOC ='000028090'

select D_E_L_E_T_, F3_CODRSEF,F3_DESCRET,D_E_L_E_T_,* 
--begin transaction UPDATE SF3 SET F3_CODRSEF	='102', F3_DESCRET = 'Inutilizacao de numero homologado', F3_OBSERV ='NF INUTILIZADA'
from SF3010  SF3 WHERE 1=1
and F3_NFISCAL ='000028090'
AND D_E_L_E_T_=''
--and F3_NFISCAL in (
--'000302851',
--'000302270',
--'000302271',
--'000302321',
--'000302431',
--'000302486',
--'000302558',
--'000302640',
--'000302641',
--'000302642',
--'000326749',
--'000302767',
--'000302780',
--'000302786',
--'000302787',
--'000302842',
--'000302873',
--'000302905',
--'000303377',
--'000303496',
--'000303512',
--'000303742',
--'000303765',
--'000303833',
--'000303863',
--'000304016',
--'000304047',
--'000304056',
--'000304065',
--'000304079',
--'000304148',
--'000304201',
--'000304301',
--'000304351',
--'000303633',
--'000303634',
--'000303635',
--'000304588',
--'000304621',
--'000304638')


--F3_DESCRET = 'Autorizado o uso da NF-e'
--F3_DESCRET = 'Cancelamento autorizado'

select FT_OBSERV, D_E_L_E_T_,* 
--begin transaction UPDATE SFT SET FT_OBSERV='NF INUTILIZADA'
from SFT010 SFT
WHERE 1=1
and FT_NFISCAL ='000028090'
--and FT_NFISCAL IN ('000303635','000303633','000303634','000326749','000302851')--,'000304638')
and D_E_L_E_T_=''
--COMMIT




SELECT * FROM SD2010 WHERE D2_DOC IN ('000303635','000303633','000303634','000326749')


--F3_NFISCAL
--000303635
--F3_NFISCAL
--000303633
--F3_NFISCAL
--000303634

SELECT * FROM SB1010
WHERE B1_COD ='011293'

--commit