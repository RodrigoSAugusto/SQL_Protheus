--SELECT * FROM MPMENU_ITEM
--WHERE I_ID_FUNC='ef30b1edc34543308299637aac4ee1df'

--SELECT * FROM MPMENU_FUNCTION
--WHERE F_FUNCTION='RNFCANC'

--SELECT * FROM MPMENU_MENU
--WHERE M_ID='ffaf7680a3b043848A1854930964ea5c'

SELECT * FROM MPMENU_I18N
WHERE N_PAREN_ID='4e966ddb79824000924B6f3601087ba8'
and N_LANG='1'

SELECT  
F_FUNCTION,
I_MODULE,
I_DEFAULT,
I_TP_MENU,
M_ARQMENU,
I_FATHER,
*
FROM MPMENU_MENU MN
JOIN MPMENU_ITEM MI ON MI.I_ID_MENU = MN.M_ID
JOIN MPMENU_FUNCTION MF ON MI.I_ID_FUNC = MF.F_ID
join MPMENU_I18N on I_FATHER=N_PAREN_ID
WHERE 1=1
--and F_FUNCTION='RNFCANC'
and I_ID_MENU ='ffaf7680a3b043848A1854930964ea5c'
--and I_ID ='DEABE039C84C400081D3E62EA9C8483D'
and N_LANG='1'


select top 1000 * from MPMENU_FUNCTION
select top 1000 * from MPMENU_I18N where N_LANG='1'
select top 1000 * from MPMENU_ITEM
select top 1000 * from MPMENU_KEY_WORDS
select top 1000 * from MPMENU_MENU
select top 1000 * from MPMENU_RW


select N_PAREN_TP,N_PAREN_ID,N_LANG,N_DESC
from MPMENU_I18N PASTA
where N_LANG='1'

select F_ID	,F_FUNCTION
from MPMENU_FUNCTION FUNCAO

select top 1000 * from MPMENU_ITEM
WHERE 
I_ID IN (
'A852CB3745B0400098DF240406D09B18',
'DEABE039C84C400081D3E62EA9C8483D',
'461F946A36B940008F6239B0EEAC7180')







