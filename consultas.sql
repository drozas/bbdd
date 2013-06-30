SELECT C.aldea_labo, COUNT(C.aldea_labo) 
FROM CAMPESINO C
GROUP BY C.aldea_labo
HAVING COUNT(C.aldea_labo) IN ( SELECT MAX(COUNT(C1.aldea_labo)) 
				FROM CAMPESINO C1
				GROUP BY C1.aldea_labo);

SELECT COUNT(*), C.codigo_labo, C.aldea_labo,L.responsable 
FROM CAMPESINO C, LABORATORIO L 
WHERE C.codigo_labo = L.codigo_lab
AND C.aldea_labo = L.aldea_lab
GROUP BY C.codigo_labo, C.aldea_labo, L.responsable
ORDER BY 1 DESC;

SELECT P.nombre
FROM ESPIA E, POLICIA P 
WHERE (E.cod_P IN (SELECT cod_P FROM CELDA)) 
AND E.cod_P=P.cod_P
AND E.cod_P=(SELECT E1.cod_P 
	FROM ESPIA E1 
	WHERE E1.n_sobornos_total=(SELECT MAX(E2.n_sobornos_total)
				FROM ESPIA E2));

SELECT * FROM SICARIO S
WHERE S.codigo_E NOT IN (SELECT codigo_E FROM CAPTURA);

SELECT D.nombre 
FROM DISTRIBUIDOR D,DISTRIBUYE_EN DE
WHERE D.codigo_E=DE.distribuidor AND DE.pais='ESPAÑA';