----------------------------------------------------------------------------------------------------------
-- ALTERA BASE E VALOR DOS IMPOSTOS NA SD1----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
BEGIN TRANSACTION UPDATE SD1010
	SET D1_TES = '165',
 		D1_BASEPIS = '292.01'	, D1_BASECOF = '292.01'	, D1_BASECSL = '292.01'	, D1_BASEISS = '292.01'	,
		D1_VALPIS = '1.90'		, D1_VALCOF = '8.76'	, D1_VALCSL = '2.92'	, D1_VALISS = '7.30'	
	WHERE D1_DOC = '011608686'
	AND D1_FILIAL = '010101'

--COMMIT --ROLLBACK
--CONSULTA RESULTADOS
SELECT D1_TES,
		D1_BASEPIS, D1_BASECOF , D1_BASECSL , D1_BASEISS ,
		D1_VALPIS  , D1_VALCOF  , D1_VALCSL  , D1_VALISS   FROM SD1010 WHERE D1_DOC = '011608686'

------------------------------------------------------------------------------------------------------
-- ALTERA BASE E VALOR DOS IMPOSTOS NA SF1------------------------------------------------------------
------------------------------------------------------------------------------------------------------

BEGIN TRANSACTION UPDATE SF1010
	SET F1_RECISS = '2',
		F1_BASPIS = '292.01'	, F1_BASCOFI = '292.01'	, F1_BASCSLL = '292.01'	,
		F1_VALPIS  = '1.90'		, F1_VALCOFI  = '8.76'	, F1_VALCSLL  = '2.92'	, F1_ISS  = '7.30'	
	WHERE F1_DOC = '011608686'
	AND F1_FILIAL = '010101'

--COMMIT

SELECT 	F1_RECISS  , 
		F1_BASPIS  , F1_BASCOFI , F1_BASCSLL , 
		F1_VALPIS  , F1_VALCOFI , F1_VALCSLL , F1_ISS  
			FROM SF1010 WHERE F1_DOC = '011608686'

------------------------------------------------------------------------------------------------------
-- ALTERA BASE E VALOR DOS IMPOSTOS NA SFT------------------------------------------------------------
------------------------------------------------------------------------------------------------------

BEGIN TRANSACTION UPDATE SFT010
	SET FT_RECISS = '2', FT_TES = '165',
		FT_BASEPIS = '292.01'	, FT_BASECOF = '292.01'	, FT_BASECSL = '292.01'	,
		FT_VALPIS  = '1.90'		, FT_VALCOF  = '8.76'	, FT_VALCSL  = '2.92'		
	WHERE FT_NFISCAL = '011608686'
	AND FT_FILIAL = '010101'

--COMMIT

SELECT 	FT_RECISS  , FT_TES, 
		FT_BASEPIS  , FT_BASECOF , FT_BASECSL ,
		FT_VALPIS  , FT_VALCOF , FT_VALCSL  
			FROM SFT010 WHERE  FT_NFISCAL = '011608686'

------------------------------------------------------------------------------------------------------
-- ALTERA BASE E VALOR DOS IMPOSTOS NA SE2------------------------------------------------------------
------------------------------------------------------------------------------------------------------

BEGIN TRANSACTION UPDATE SE2010
	SET E2_CODRET = '5952', E2_PARCISS = '001', E2_FORNISS = '000001', E2_LOJAISS = '0001', E2_PARCPIS = '001', 
		E2_VRETPIS = '1.9', E2_VRETCOF = '8.76', E2_VRETCSL = '2.9', E2_VRETISS = '7.30', E2_MDRTISS = '1', E2_TRETISS = '1'
		-- E2_CODRPIS = '5952', E2_CODRCOF = '5952', E2_CODRCSL = '5952'
		--E2_NATUREZ = '3001024', 
		--E2_BASEPIS	= '292.01'	, E2_BASECOF = '292.01'	, E2_BASECSL = '292.01'	, E2_BASEISS = '292.01',
		--E2_PIS		= '1.90'		, E2_COFINS  = '8.76'	, E2_CSLL  = '2.92'		,E2_ISS = '7.30'
	WHERE E2_NUM = '011373968'
	AND E2_FILIAL = '010101'

--COMMIT ROLLBACK

SELECT E2_NATUREZ,
		E2_BASEPIS, E2_BASECOF, E2_BASECSL, E2_BASEISS, 
		E2_PIS	, E2_COFINS , E2_CSLL, E2_ISS ,*
			FROM SE2010 WHERE E2_FORNECE = '889443' 
			AND E2_NUM in  ('011373968','011748514','011748512')
			and D_E_L_E_T_ = ''
			ORDER BY E2_NUM




