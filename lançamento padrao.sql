select * 
--begin transaction UPDATE CT5 SET CT5_HIST ='Substr("EXC RA: "+ALLTRIM(SE1->E1_NUM)+" "+ALLTRIM(SE1->E1_PARCELA)+" - "+ALLTRIM(SA1->A1_NOME),1,40)                                                                                                    '
--begin transaction UPDATE CT5  set CT5_VLR01='IIF(SE1->(EOF()),0,VALOR)'
from CT5010 CT5
where 1=1
--and (
--   CT5_VLR01  like '%F4_AUTATF%'
--or CT5_CREDIT like '%F4_AUTATF%'
--or CT5_DEBITO like '%F4_AUTATF%'
--or CT5_HIST   like '%F4_AUTATF%'
--)
AND D_E_L_E_T_=''
and CT5_LANPAD='655'
and CT5_FILIAL='03'
--commit


                                                                                                                                                                                                        