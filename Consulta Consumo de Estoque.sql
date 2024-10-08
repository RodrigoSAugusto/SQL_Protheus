


select * from SD2010 where  D2_COD = '005542'

SELECT	'SD2' AS TABELA,
		B5_COD AS CODIGO,
		B5_FILIAL,
		B5_CEME,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542' AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '1' AND D_E_L_E_T_ = '') + 
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '1' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS JAN,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '2' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '2' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS FEV,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '3' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '3' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS MAR,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '4' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '4' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS ABR,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '5' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '5' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS MAI,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '6' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '6' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS JUN,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '7' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '7' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS JUL,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '8' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '8' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS AGO,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '9' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '9' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS 'SET',
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '10' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '10' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS 'OUT',
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '11' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '11' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS NOV,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND  MONTH(D2_EMISSAO) = '12' AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '12' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS DEZ,
		(SELECT ROUND(ISNULL(SUM(D2_QUANT)/12,0),2) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022' AND D_E_L_E_T_ = '') +
			(SELECT ROUND(ISNULL(SUM(D3_QUANT)/12,0),2) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS MEDIA,
		(SELECT ISNULL(SUM(D2_QUANT),0) FROM SD2010 WHERE D2_FILIAL in ('010101') AND D2_COD = '005542'  AND YEAR(D2_EMISSAO) = '2022'  AND D_E_L_E_T_ = '') +
			(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022'  AND D3_CF = 'RE7' AND D_E_L_E_T_ = '') AS TOTAL
			FROM SB5010
					WHERE D_E_L_E_T_ = ''
						and B5_FILIAL = '010101'
						AND B5_COD = '005542'
					GROUP BY B5_COD,B5_FILIAL, B5_CEME


SELECT	'SD3' AS TABELA,
		B5_COD AS CODIGO,
		B5_FILIAL,
		B5_CEME,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '1' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS JAN,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '2' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS FEV,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '3' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS MAR,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '4' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS ABR,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '5' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS MAI,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '6' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS JUn,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '7' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS JUL,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '8' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS AGO,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '9' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS 'SET',
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '10' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS 'OUT',
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '11' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS NOV,
		(SELECT ISNULL(SUM(D3_QUANT),0) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND  MONTH(D3_EMISSAO) = '12' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS DEZ,
		(SELECT ROUND(ISNULL(SUM(D3_QUANT)/12,0),2) FROM SD3010 WHERE D3_FILIAL in ('010101') AND D3_COD = '005542'  AND YEAR(D3_EMISSAO) = '2022' AND D3_CF = 'RE7' AND D_E_L_E_T_ = '')  AS MEDIA
			FROM SB5010
					WHERE D_E_L_E_T_ = ''
						and B5_FILIAL = '010101'
						AND B5_COD = '005542'
					GROUP BY B5_COD,B5_FILIAL, B5_CEME





select * from SD2010 where  D2_COD = '005542'



