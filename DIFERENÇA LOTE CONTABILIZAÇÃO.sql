declare @filial varchar(6)
declare @mes varchar(2)
declare @ano Varchar(4)

set @filial = '030102'
set @mes = '12'
set @ano = '2023'

SELECT 
A.CT2_FILIAL
,A.CT2_DATA
,A.CT2_LOTE
,A.CT2_SBLOTE
,A.CT2_VALOR CREDITO
,B.CT2_VALOR DEBITO
,ROUND(A.CT2_VALOR-B.CT2_VALOR,2) DIFERENÇA

FROM 

(select 
CT2_FILIAL
,CT2_DATA
,CT2_LOTE
,CT2_SBLOTE
,CT2_DC
,round(sum(CT2_VALOR),2) CT2_VALOR
 from CT2010 
 where 1=1 
 --CT2_LOTE = '008890' --
 and month(CT2_DATA) = @mes
 and year(CT2_DATA) = @ano 
 and CT2_FILIAL = @filial
 and CT2_DC IN ('1')
 and D_E_L_E_T_ = ''
 group by CT2_FILIAL
,CT2_DC
,CT2_LOTE
,CT2_DATA
,CT2_SBLOTE)A
INNER JOIN 
(select 
CT2_FILIAL
,CT2_DATA
,CT2_LOTE
,CT2_SBLOTE
,CT2_DC
,round(sum(CT2_VALOR),2) CT2_VALOR
 from CT2010 
 where 1=1 
 --CT2_LOTE = '008890' --
 and month(CT2_DATA) = @mes 
 and year(CT2_DATA) = @ano 
 and CT2_FILIAL = @filial
 and CT2_DC IN ('2')
 and D_E_L_E_T_ = ''
 group by CT2_FILIAL
,CT2_DC
,CT2_LOTE
,CT2_DATA
,CT2_SBLOTE)B 
ON A.CT2_FILIAL = B.CT2_FILIAL
AND A.CT2_DATA = B.CT2_DATA
AND A.CT2_LOTE = B.CT2_LOTE
AND A.CT2_SBLOTE = B.CT2_SBLOTE

WHERE ROUND(A.CT2_VALOR-B.CT2_VALOR,2) <> 0

ORDER BY A.CT2_FILIAL, A.CT2_DATA, A.CT2_LOTE

