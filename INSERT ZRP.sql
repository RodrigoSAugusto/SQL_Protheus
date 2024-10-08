


select * from SC5010 where C5_NUM = '027106'



SELECT	C5_FILIAL,
		TTAT_USER,
		TTAT_USERID,
		TTAT_DTIME,
		C5_NUM,
		0,
		(SELECT MAX(R_E_C_N_O_ + 1) FROM ZRP010)
			FROM SC5010_TTAT_LOG
				JOIN SC5010 SC5 (NOLOCK) ON TTAT_RECNO=SC5.R_E_C_N_O_
						WHERE 	1=1
								AND C5_NUM = '027106'
								AND TTAT_FIELD = 'C5_EMISSAO'
								AND C5_FILIAL = '020101'
						order by SC5.C5_NUM, TTAT_DTIME



		SELECT	*
				FROM SUA010_TTAT_LOG
					JOIN SUA010 SUA (NOLOCK) ON TTAT_RECNO=SUA.R_E_C_N_O_
						WHERE 	1=1
						AND UA_NUM = '221274'
						AND UA_FILIAL = '020101'
						order by TTAT_DTIME DESC

						--AND TTAT_FIELD = 'UA_OPERADO'
						--AND TTAT_COLD != TTAT_CNEW

SELECT  ZRP_USER,
        ZRP_USERID,
        CONVERT(VARCHAR,CONVERT(DATE,ZRP_DATA), 103) AS LOGDATE,
        CONVERT(VARCHAR,CONVERT(TIME,ZRP_DATA), 108) AS LOGTIME,
        ZRP_STATUS,
        CONVERT(VARCHAR,R_E_C_N_O_) AS RECNO
			FROM ZRP010 (NOLOCK) 
				WHERE   ZRP_NUMERO = '186675'
					AND ZRP_FILIAL = '020101'
                               
                ORDER BY CONVERT(DATETIME,ZRP_DATA)


select * from ZRP010 where ZRP_NUMERO = '245180' 


SELECT * FROM SUA010_TTAT_LOG
JOIN SUA010 SUA (NOLOCK) ON TTAT_RECNO=SUA.R_E_C_N_O_
WHERE 1=1
and UA_FILIAL='020101'
--and UA_NUMSC5 = '077109'
AND UA_NUM='245180' 
--AND TTAT_FIELD NOT LIKE'%USERLGA'
--AND TTAT_COLD<>TTAT_CNEW
ORDER BY TTAT_DTIME

SELECT	TOP 1 TTAT_CNEW, *
					FROM SUA010_TTAT_LOG
						JOIN SUA010 SUA (NOLOCK) ON TTAT_RECNO=SUA.R_E_C_N_O_
							WHERE 	1=1
							AND TTAT_FIELD = 'UA_OPERADO'
							AND TTAT_COLD != TTAT_CNEW
							AND UA_NUM = '243992'
							AND UA_FILIAL = '020101'
							ORDER by TTAT_DTIME DESC

select * from SUA010 where UA_NUMSC5 = '230340'

select * from SU7010 where U7_COD = '000039' AND U7_FILIAL = '020101'
select * from SU7010 where U7_COD = '000037' AND U7_FILIAL = '020101'



