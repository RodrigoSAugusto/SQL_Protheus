-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--select * from F_CONF_SALDO('010101')
alter FUNCTION [dbo].[F_CONF_SALDO](@FILIAL VARCHAR(6))


--= @FILIAL

RETURNS TABLE AS RETURN (

SELECT *,   ROUND(LOTES-SALDO, 4) DIF
FROM(
	SELECT B2_FILIAL,
          B2_COD,
          B1_DESC,
          B1_RASTRO,
          B1_LOCALIZ,
          B2_LOCAL,
          B2_QATU SALDO,
          BF_QUANT ENDEREÇOS,
          B2_QACLASS ENDERECAR,
          ISNULL(B8_SALDO, 0) LOTES
   FROM(
			SELECT B2_FILIAL,
				 B2_COD,
				 B2_LOCAL,
				 B2_QATU,
				 B2_QACLASS
			FROM SB2010 (nolock)
			WHERE 1=1 --AND B2_COD='005693'
			AND B2_FILIAL =@FILIAL
			AND D_E_L_E_T_='' 
		)AAA
   
   LEFT JOIN (
			SELECT BF_LOCAL,
				 BF_PRODUTO,
				 SUM(BF_QUANT)BF_QUANT
			FROM SBF010 (nolock)
			WHERE 1=1
				AND BF_FILIAL=@FILIAL
				--AND BF_PRODUTO='005693'
				AND D_E_L_E_T_='' 
				--and BF_EMPENHO<>0
				--and BF_LOTECTL='880573R'
			  GROUP BY BF_FILIAL, BF_LOCAL, BF_PRODUTO
		 )BBB ON BF_PRODUTO=B2_COD
			AND BF_LOCAL=B2_LOCAL
	
	LEFT JOIN(
			SELECT 
				 B8_PRODUTO,
				 B8_LOCAL,
				 SUM(B8_SALDO)B8_SALDO
			FROM SB8010 (nolock)
			WHERE 1=1
				AND B8_FILIAL=@FILIAL 
				--AND B8_PRODUTO='005693'
				AND B8_SALDO>0
				AND D_E_L_E_T_='' 
				--and B8_EMPENHO<>0

			  GROUP BY B8_FILIAL, B8_LOCAL, B8_PRODUTO
		 )CCC ON B8_PRODUTO=B2_COD
					AND B8_LOCAL=B2_LOCAL
   JOIN SB1010 SB1 (nolock) ON B1_FILIAL=B2_FILIAL
   AND B1_COD=B2_COD
   
   WHERE 1=1
     AND B1_RASTRO IN('L','S') 
--AND (B2_QATU-B8_SALDO>0.001)
--OR (B2_QATU-BF_QUANT>0.001)
--OR (B8_SALDO-BF_QUANT>0.001)
--OR B8_SALDO<>BF_QUANT
--OR B2_QATU<>B8_SALDO
--)DDD 
--WHERE LOTES-SALDO<>0

)AS RESULT
WHERE 1=1
--AND FILIAL = @FILIAL
)