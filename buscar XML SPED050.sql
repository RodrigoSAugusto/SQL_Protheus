select 
CONVERT(varchar(MAX),CONVERT(VARBINARY(MAX), XML_ERP)) as XMLERP,
*
from tss_nfe_producao..SPED050
WHERE NFE_ID LIKE '%302907%'

