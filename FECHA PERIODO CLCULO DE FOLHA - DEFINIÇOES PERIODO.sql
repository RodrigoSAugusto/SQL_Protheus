select * 
--BEGIN TRANSACTION UPDATE RFQ010 SET RFQ_STATUS='2'
from RFQ010 RFQ
WHERE 1=1
AND RFQ_FILIAL='0201'
AND RFQ_PROCES='00003'
AND RFQ_PERIOD LIKE '2019%'
--COMMIT


select * 
--BEGIN TRANSACTION UPDATE RCH SET RCH_STATUS='5', RCH_DTFECH ='20200131'
from RCH010 RCH
WHERE 1=1
AND RCH_ROTEIR='AUT'
AND RCH_FILIAL='0201'
AND RCH_PER='202001'
--COMMIT