

SELECT 	DISTINCT YEAR(E1_VENCREA),	
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '1' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS JAN,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '2' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS FEV,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '3' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS MAR,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '4' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS ABR,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '5' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS MAI,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '6' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS JUN,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '7' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS JUL,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '8' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS AGO,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '9' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS 'SET',
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '10' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS 'OUT',
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '11' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS NOV,
		(SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND  MONTH(E1_VENCREA) = '12' AND E1_TIPO in ('NF', 'FT') AND D_E_L_E_T_ = '') AS DEZ

		FROM SE1010

		 WHERE	E1_FILIAL = '010101' 
				AND YEAR(E1_VENCREA) = '2020'  
				AND D_E_L_E_T_ = ''
			GROUP BY E1_VENCREA

SELECT ROUND(SUM(E1_SALDO),2) FROM SE1010 WHERE E1_FILIAL = '010101' AND YEAR(E1_VENCREA) = '2020' AND E1_TIPO in ('NF', 'FT')  AND MONTH(E1_VENCREA) = '3' AND D_E_L_E_T_ = ''

Select * from SB8010 WHERE B8_DOC = '000010623'

SELECT distinct E1_TIPO FROM SE1010 WHERE  E1_NUM = '000357948' AND E1_VENCREA = '20221215'   AND MONTH(E1_VENCREA) = '12' AND D_E_L_E_T_ = ''


