select * from SD4010 
where 1=1
--and	D4_PRODUTO ='026031'
AND D_E_L_E_T_=''
and D4_OP like '%05837703001%'   


SELECT B2_CM2*B2_QATU B2_VATU2_N,B2_CM3*B2_QATU B2_VATU3_N, B2_VATU3 ,* 
--BEGIN TRANSACTION UPDATE SB2 SET B2_VATU4=0,	B2_CM4=0,B2_VATU5=0,	B2_CM5=0
--BEGIN TRANSACTION UPDATE SB2 SET B2_VATU2=round(B2_CM2*B2_QATU,4)--, B2_VATU3=round(B2_CM3*B2_QATU,4)
--BEGIN TRANSACTION UPDATE SB2 SET B2_CM3=round(0.8287*B2_CM1,4),B2_CM2=round(5.2986*B2_CM1,4)
--BEGIN TRANSACTION UPDATE SB2 SET B2_CM4=B2_CM1, B2_CM5=B2_CM1, B2_VATU4	=B2_CM1*B2_QATU, B2_VATU5=B2_QATU*B2_CM1

--BEGIN TRANSACTION UPDATE SB2 SET  B2_VATU4=0,	B2_CM4=0

--select * 
FROM SB2010 SB2 (nolock)
WHERE 1=1 
and B2_FILIAL='010101'
AND B2_COD='021335'
and B2_COD IN (--'022027','018929','021291','024345')
'021338',         
'021336'
)       

--rollback
--commit


SELECT * FROM SB9010
WHERE B9_COD='021339'

--COMMIT
--rollback


select * from SC6010
where C6_NUM='039076'






