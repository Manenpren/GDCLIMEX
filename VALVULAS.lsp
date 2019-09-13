(defun c:VALV ()
  (prOMPt "DIBUJA VALVULAS")
  (setq NOMARCH (getfiled "ARCHIVO DE DATOS" "" "CSV" 32))
  (setq arch (OPEN NOMARCH "r"))
  (if (= arch NIL)
    (PROGN
      (print "\n Archivo no encontrado ")
      (EXIT)
    )
  )
  (COMMAND "INSERT" (STRCAT RUTA "BLOCKS\\VALVULA") 0,0 "" "" "" "" "" "")
  (SETQ LIN (READ-LINE arch))
  (WHILE LIN
    (SEPARA)
    (COMMAND "INSERT" "VALVULA" (STRCAT V1 "," V2) "" "" "" V3 V4 "" "")
    (SETQ LIN (READ-LINE arch))
  )
)

(DEFUN SEPARA ()
  (SETQ CONT 1)
  (SETQ CAR (SUBSTR LIN 1 1))
  (SETQ NVAL 1)
  (SETQ CINICIO 0)
  (WHILE (AND (/= CAR "") (/= CAR NIL))
    (IF (= CAR ",") 
      (PROGN
        (SETQ VPROV (SUBSTR LIN (1+ CINICIO) (1- CONT)))
        (IF (= NVAL 1)
          (SETQ V1 VPROV) 
        )
        (IF (= NVAL 2)
          (SETQ V2 VPROV) 
        )
        (IF (= NVAL 3)
          (SETQ V3 VPROV) 
        )
        (SETQ NVAL (1+ NVAL))
        (SETQ CINICIO (+ CINICIO CONT))
        (SETQ CONT 1)
      )
    )
    (SETQ CONT (1+ CONT))
    (SETQ CAR (SUBSTR LIN (+ CONT CINICIO) 1))
  )
  (SETQ V4 (SUBSTR LIN (1+ CINICIO) CONT))
)