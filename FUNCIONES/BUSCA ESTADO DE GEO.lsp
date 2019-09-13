(DEFUN ESTADOGEO (PGEO)
  ;(C:LIBRERIA "DENTRO FUERA POLIGONA")
  (C:LIBRERIA "ARCHIVO TO BD POLYLINE")
  (SETQ LONG1 (RTOS (car PGEO) 2 5))
  (SETQ LAT1 (RTOS (caDr PGEO) 2 5))
  (setq archIVOCL (open (strcat ruta "BASES DE DATOS\\POLIGONOS ESTADOS\\CENTROIDES.CSV") "r"))
  (setq lINEAfUENTE (read-line archIVOCL))
  (SETQ RESULTADO nil)
  (setq polx "")
  (setq bdpol nil)
  (while (and (/= lineafuente nil)(/= polx "DENTRO"))
    (SETQ VALORES (SEPARA_VAL_COMAS LINEAFUENTE))
    (setq LATES2 (cdr (assoc 6 valores)))
    (setq LONGES2 (cdr (assoc 5 valores)))
    (setq LATES1 (cdr (assoc 8 valores)))
    (setq LONGES1 (cdr (assoc 7 valores)))
    (setq CLAVEE (ATOI (cdr (assoc 1 valores))))
    (IF (< CLAVEE 10) (SETQ CLAVEE (STRCAT "0" (ITOA CLAVEE))) (SETQ CLAVEE (ITOA CLAVEE)))
    (IF (AND (> (ATOF LATES2) (ATOF LAT1)) (< (ATOF LATES1) (ATOF LAT1)) (> (ATOF LONGES2) (ATOF LONG1)) (< (ATOF LONGES1) (ATOF LONG1)))
      (PROGN
        (SETQ BDPOL (ARCBD (STRCAT "D:\\LISPMSA\\bases de datos\\poligonos estados\\" CLAVEE ".CSV")))
        (setq puntox (list (atof long1) (atof lat1)))
        (SETQ POLX (DENTROFA BDPOL puntox))
        (IF (= POLX "DENTRO") (SETQ RESULTADO CLAVEE))
      )
    )
    (setq lINEAfUENTE (read-line archIVOCL))
  );WHILE
  (close archivocl)
  (SETQ RESULTADO RESULTADO)
) ;(setq d(dentrofa (ARCBD (STRCAT "D:\\LISPMSA\\bases de datos\\poligonos estados\\16.CSV")) (getpoint "punto")))

