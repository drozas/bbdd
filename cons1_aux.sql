 /*Consulta 1*/
/*Subconsulta que devuelve el nº de campesinos que trabajan en 
 cualquier laboratorio de una poblacion. No recoge la ordenación
 por "mayor peligrosidad", porque no realiza la diferencia entre
 el nº de habitantes de ese pueblo, y los que trabajan para 
 la organización*/
SELECT C.aldea_labo, COUNT(C.aldea_labo) 
FROM CAMPESINO C
GROUP BY C.aldea_labo
HAVING COUNT(C.aldea_labo) IN ( SELECT MAX(COUNT(C1.aldea_labo)) 
				FROM CAMPESINO C1
				GROUP BY C1.aldea_labo);

