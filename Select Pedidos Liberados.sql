
SELECT DISTINCT C9_PEDIDO,
		C9_DATALIB,
		C9_CLIENTE,
		C9_BLCRED
		FROM (
SELECT	distinct C9_PEDIDO, 
		C9_DATALIB, 
		C9_CLIENTE,
		C9_BLCRED
		FROM SC9010

		WHERE	C9_DATALIB  >= '20230901'
			AND C9_DATALIB  <= '20231023'
			AND C9_BLCRED <> '10'
			AND C9_FILIAL = '020101'
			AND D_E_L_E_T_ = '') AS T1
			group by C9_PEDIDO, C9_CLIENTE,	C9_DATALIB,C9_BLCRED
			order by C9_PEDIDO

			select * from SC9010
			where C9_XLIBCRE  <> ''
			AND C9_BLCRED in ('','10')
			AND D_E_L_E_T_ = ''
				

select  C9_PEDIDO,
		C9_DATALIB,
		C9_CLIENTE,
		C9_BLCRED,
		C9_BLEST,
		D_E_L_E_T_,
		*
		
		FROM SC9010

		WHERE C9_BLCRED in ('','10')
			AND C9_FILIAL = '010101'
			and C9_PEDIDO = '073016'
			
			order by C9_PEDIDO




select  
		*
		
		FROM SC9010

-------------------------------------------------------------------------------------------------------------------------------------------------
--------CONSULTA ANTIGA--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT	DISTINCT 
				T1.C9_FILIAL,
				T1.C9_PEDIDO,
				C9_XUSER,
				T1.C9_XLIBCRE,
				T1.C9_CLIENTE
				FROM ( SELECT	DISTINCT 
								C9_FILIAL, 
								C9_PEDIDO,
								CONVERT(VARCHAR(10),CONVERT(DATE,C9_XLIBCRE,103),103) AS C9_XLIBCRE,
								C9_CLIENTE                 
								FROM SC9010
									WHERE	C9_XLIBCRE  >= %EXP:cDataIni%
										AND C9_XLIBCRE  <= %EXP:cDataFim%
										AND C9_ITEM     <> '' 
										AND C9_FILIAL   IN ('010101', '010102', '010106')
										AND C9_XUSER    IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') ) AS T1
										LEFT JOIN SC9010 SC9 ON 1=1 
										AND T1.C9_FILIAL  = SC9.C9_FILIAL
										AND T1.C9_PEDIDO  = SC9.C9_PEDIDO 
										AND T1.C9_CLIENTE = SC9.C9_CLIENTE 
                                        AND SC9.C9_XLIBCRE  >= %EXP:cDataIni%
										AND SC9.C9_XLIBCRE  <= %EXP:cDataFim%
										WHERE C9_XUSER <> ''
                                        AND C9_XUSER    IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG')

-------------------------------------------------------------------------------------------------------------------------------------------------

SELECT
			C9_PEDIDO, *               
		FROM SC9010
			WHERE	1=1
				AND C9_PEDIDO =	'011958'
				--AND C9_XLIBCRE BETWEEN '20240111' AND '20240411'
				AND C9_ITEM     <> '' 
				AND C9_FILIAL   IN ('010102')
				AND C9_XUSER    IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') 
	


SELECT DISTINCT
		SC9.C9_FILIAL,
		SC9.C9_PEDIDO, 
		SC9.C9_XUSER,
		SC9.C9_XLIBCRE,
		SC9.C9_CLIENTE 
	FROM (	SELECT  
					C9_PEDIDO, 
					MIN(NULLIF(C9_XLIBCRE,0)) AS C9_XLIBCRE,
					C9_FILIAL,
					C9_CLIENTE
				FROM SC9010 
					WHERE C9_FILIAL = '010102' 
						AND C9_XLIBCRE <> ''
						AND C9_PEDIDO in  (SELECT DISTINCT
													C9_PEDIDO             
												FROM SC9010
													WHERE	1=1
														AND C9_XLIBCRE BETWEEN '20240219' AND '20240219'
														AND C9_ITEM     <> '' 
														AND C9_FILIAL   IN ('010102')
														AND C9_XUSER    IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') 
											) group by C9_PEDIDO, C9_XUSER,	C9_XLIBCRE,	C9_CLIENTE,C9_ITEM,	C9_FILIAL
		) AS T1
		LEFT JOIN SC9010 SC9 ON 1=1 
		AND T1.C9_FILIAL  = SC9.C9_FILIAL
		AND T1.C9_PEDIDO  = SC9.C9_PEDIDO 
		AND T1.C9_CLIENTE = SC9.C9_CLIENTE 
		AND SC9.C9_XLIBCRE  >= '20240219'
		AND SC9.C9_XLIBCRE  <= '20240219'
			WHERE	1=1
				AND SC9.C9_XLIBCRE BETWEEN '20240219' AND '20240219'
				AND C9_ITEM     <> '' 
				AND SC9.C9_FILIAL   IN ('010102')
				AND C9_XUSER    IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG')








SELECT
    SC9.C9_FILIAL,    SC9.C9_PEDIDO, 
    SC9.C9_XUSER,    SC9.C9_XLIBCRE,
    SC9.C9_CLIENTE 
FROM SC9010 SC9
INNER JOIN (
    -- Etapa 1: Pedidos liberados no dia pesquisado
    SELECT  
        C9_PEDIDO,
        MIN(NULLIF(C9_XLIBCRE,0)) AS C9_XLIBCRE
    FROM SC9010 
    WHERE C9_FILIAL IN ('010101','010102','010106')
        AND C9_XLIBCRE <> ''
        AND C9_XLIBCRE BETWEEN '20240422' AND '20240422'
        AND C9_ITEM <> '' 
        AND C9_XUSER IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') 
    GROUP BY C9_PEDIDO
) AS PedidosDia ON SC9.C9_PEDIDO = PedidosDia.C9_PEDIDO
LEFT JOIN (
    -- Etapa 2: Pedidos verificados em outros dias
    SELECT  
        C9_PEDIDO
    FROM SC9010 
    WHERE C9_FILIAL IN ('010101','010102','010106') 
        AND C9_XLIBCRE <> ''
        AND C9_XLIBCRE <> '20240422' -- Exclui liberações do dia pesquisado
        AND C9_ITEM <> ''
		AND C9_PEDIDO IN (
							SELECT  
								C9_PEDIDO
							FROM SC9010 
							WHERE C9_FILIAL IN ('010101','010102','010106') 
								AND C9_XLIBCRE <> ''
								AND C9_XLIBCRE BETWEEN '20240422' AND '20240422'
								AND C9_ITEM <> '' 
								AND C9_XUSER IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') 
							GROUP BY C9_PEDIDO
							)
        AND C9_FILIAL IN ('010101','010102','010106')
        AND C9_XUSER IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') 
    GROUP BY C9_PEDIDO
) AS PedidosOutrosDias ON SC9.C9_PEDIDO = PedidosOutrosDias.C9_PEDIDO
WHERE C9_FILIAL IN ('010101','010102','010106')
	AND C9_XUSER IN ('GISLENER-TG', 'CAROLINER-TG','LARISSAS-TG','NATACHAM-TG','MARIAJ-TG') 
	AND PedidosOutrosDias.C9_PEDIDO IS NULL -- Etapa 3: Exclui pedidos liberados em outros dias



