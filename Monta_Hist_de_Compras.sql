-- CONSULTA / MONTA HIST�RICO DE COMPRAS POR CLIENTE. 

SELECT DISTINCT C6_PRODUTO AS C�DIGO , C6_DESCRI AS DESCRI��O, C6_PRUNIT AS VALOR_UNI , C6_DATFAT AS ULTIMA_COMPRA 
FROM SC5010 
INNER JOIN SC6010 ON 1=1 AND C5_NUM = C6_NUM AND C5_FILIAL = C6_FILIAL AND C5_CLIENTE = C6_CLI
WHERE  C5_CLIENTE = '030139' 
AND C5_FILIAL = '010101'
AND C6_NOTA !=''
ORDER BY C6_DATFAT DESC 


--SELECT *
--FROM SC5010
--WHERE C5_NUM = '000842'

SELECT *
FROM SC6010
WHERE C6_NUM = '000842'
AND C6_DATFAT BETWEEN 20210101 AND 20240101
