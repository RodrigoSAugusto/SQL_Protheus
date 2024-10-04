---------------------------------------------------------------------------------------
--Selecr ZCF010 para cotação de frete, primeiro faz-se um select com os RECNOS e depois
--passa-se os resultados dessa pesquisa para a segunda consulta. 
---------------------------------------------------------------------------------------
SELECT TOP 1 
		R_E_C_N_O_ 
        FROM ZCF010 
        WHERE ZCF_FILIAL = '' 
        AND ZCF_NUM = '' 
        AND D_E_L_E_T_ = ''

  SELECT	
            ZCF_STATUS,
            ZCF_NUM,
            UA_CLIENTE,
            A1_NOME,
            A1_CGC,
            US_NOME,
		    US_CGC,
            UA_NUMSC5,
            A3_NREDUZ,
            UA_PROSPEC,
            CONVERT(VARCHAR,CONVERT(DATE,ZCF_EMISSA), 103) AS EMIDATE,
            CONVERT(VARCHAR,CONVERT(TIME,ZCF_EMISSA), 108) AS EMITIME,
            CASE WHEN ZCF_DTORC = '-' THEN '-' else CONVERT(VARCHAR,CONVERT(DATE,ZCF_DTORC), 103) END AS ORCDATE,
            CASE WHEN ZCF_DTORC = '-' THEN '-' else CONVERT(VARCHAR,CONVERT(TIME,ZCF_DTORC), 108) END AS ORCTIME,
            ZCF_VFRETE,
            ZCF_VALPED,
            ZCF_VOLUME,
            ZCF_PESO,
            ZCF_ALTURA,
            ZCF_LARGUR,
            ZCF_COMPRI,
            ZCF_OBS
            FROM ZCF010 ZCF 
            LEFT OUTER JOIN SUA010 SUA ON UA_FILIAL = ZCF_FILIAL AND ZCF_NUM = UA_NUM
            LEFT OUTER JOIN SA1010 SA1 ON A1_COD = UA_CLIENTE AND A1_LOJA = UA_LOJA AND A1_FILIAL = LEFT(UA_FILIAL,4) AND SA1.D_E_L_E_T_ = ''
            LEFT OUTER JOIN SUS010 SUS ON US_COD = UA_CLIENTE AND US_LOJA = UA_LOJA AND US_FILIAL = LEFT(UA_FILIAL,4) AND SUS.D_E_L_E_T_ = ''
            LEFT OUTER JOIN SA3010 SA3 ON UA_VEND = A3_COD AND LEFT(UA_FILIAL,4) = A3_FILIAL
            WHERE ZCF_FILIAL = '010101'
            AND ZCF_EMISSA >= '20230601'
            AND ZCF_EMISSA <= '20230630'
            AND ZCF.D_E_L_E_T_ = ''
            --AND ZCF.R_E_C_N_O_ IN ('')
            AND ZCF_STATUS IN ('1','2','3')
            ORDER BY ZCF_EMISSA DESC     
			
			
		SELECT * FROM(
		select ZCF_EMISSA, ZCF_DTORC, DATEDIFF(minute,ZCF_EMISSA, ZCF_DTORC) AS TEMPO_Médio
		FROM ZCF010
		WHERE ZCF_FILIAL = '010101'
            AND ZCF_EMISSA >= '20230601'
            AND ZCF_EMISSA <= '20230630'
            AND D_E_L_E_T_ = ''
			and ZCF_DTORC not in ('-', '')
            --AND ZCF.R_E_C_N_O_ IN ('')
            AND ZCF_STATUS IN ('1','2','3')) AS T1
				WHERE TEMPO_Médio < '1440'

			union all

		select	'Tempo_médio', '-', sum(DATEDIFF(minute,CONVERT(DATETIME,ZCF_EMISSA, 109),ZCF_DTORC))/count(TEMPO_Médio) AS Tempo_medio
		FROM (select ZCF_EMISSA, ZCF_DTORC, DATEDIFF(minute,ZCF_EMISSA, ZCF_DTORC) AS TEMPO_Médio
		FROM ZCF010
		WHERE ZCF_FILIAL = '010101'
            AND ZCF_EMISSA >= '20230701'
            AND ZCF_EMISSA <= '20230730'
            AND D_E_L_E_T_ = ''
			and ZCF_DTORC not in ('-', '')
            --AND ZCF.R_E_C_N_O_ IN ('')
            AND ZCF_STATUS IN ('1','2','3')) AS T2
				WHERE TEMPO_Médio < '540'   
			



		SELECT ZCF_EMISSA, ZCF_DTORC FROM ZCF010 
		ORDER BY ZCF_DTORC