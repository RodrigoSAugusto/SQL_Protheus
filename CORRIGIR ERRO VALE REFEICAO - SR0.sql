select * 
--into BKP_SR0010_20210128_ERRO
--BEGIN TRANSACTION UPDATE SR0 SET D_E_L_E_T_='*' , R_E_C_D_E_L_  = R_E_C_N_O_
from SR0010 SR0
WHERE R0_FILIAL='030101'
--AND R0_MAT='000030'
AND D_E_L_E_T_=''
and R0_TPVALE='0'

--COMMIT
--select * from SR0010
--WHERE R0_FILIAL='010101'
--AND R0_MAT='000168'
--AND D_E_L_E_T_=''


SELECT * FROM RFP010

SELECT * FROM RG2010

RG2_TPVALE+RG2_CODIGO