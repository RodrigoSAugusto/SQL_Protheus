select RV_CODCOM_,* from  SRV010 SRV01

WHERE RV_FILIAL='01'  
AND D_E_L_E_T_=''

select RV_CODCOM_,* from  SRV010 SRV02
WHERE RV_FILIAL='02'    
AND D_E_L_E_T_=''

select RV_CODCOM_,* from  SRV010 SRV03
WHERE RV_FILIAL='03'
AND D_E_L_E_T_=''

--#####################################################################################
select SRV02.RV_COD, SRV01.RV_CODCOM_ VERBA_TG, SRV02.RV_CODCOM_ VERBA_PI, SRV03.RV_CODCOM_ VERBA_TQ
--,* 

--BEGIN TRANSACTION UPDATE SRV02 SET SRV02.RV_CODCOM_=SRV01.RV_CODCOM_ 
--BEGIN TRANSACTION UPDATE SRV03 SET SRV03.RV_CODCOM_=SRV01.RV_CODCOM_
from  SRV010 SRV02
join SRV010 SRV01 ON SRV01.RV_FILIAL='01' AND SRV01.RV_COD=SRV02.RV_COD AND SRV01.D_E_L_E_T_=''
join SRV010 SRV03 ON SRV03.RV_FILIAL='03' AND SRV03.RV_COD=SRV02.RV_COD AND SRV03.D_E_L_E_T_=''

WHERE SRV02.RV_FILIAL='02'    
AND SRV02.D_E_L_E_T_=''

--COMMIT

--select * into SRV010_BKP_20210429 from  SRV010


