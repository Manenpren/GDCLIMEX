(DEFUN DECSEXA (DATO)
  (SETQ GRADOS (FIX DATO))
  (SETQ MINUTOS (FIX (* (- DATO GRADOS) 60)))
  (SETQ SEGUNDOS (* (- DATO (+ GRADOS (/ MINUTOS 60.00))) 60.0000 60.0000))
  (if (and (< dato 0) (= grados 0)) (setq complemento "-") (setq complemento ""))
  (PRINT MINUTOS)
  (IF (= "60" (RTOS (abs SEGUNDOS) 2 0))
    (PROGN
      (SETQ SEGUNDOS 0)
      (SETQ MINUTOS (1+ (ABS MINUTOS)))
    )
  )
  (IF (= 60 (ABS MINUTOS))
    (PROGN
      (SETQ MINUTOS 0)
      (SETQ GRADOS (1+ (ABS GRADOS)))
    )
  )
  (IF (< (abs MINUTOS) 10) 
    (SETQ COMP1 "0") 
  )
  (IF (> (abs MINUTOS) 10) 
    (SETQ COMP1 "")
  )
  (IF (< (abs SEGUNDOS) 10) 
    (SETQ COMP2 "0") 
  )
  (IF (> (abs SEGUNDOS) 10) 
    (SETQ COMP2 "")
  )
  (SETQ DATOFINAL (STRCAT complemento (ITOA GRADOS) "�" COMP1 (ITOA (abs MINUTOS)) "'" COMP2 (RTOS (abs SEGUNDOS) 2 6) (CHR 34) "''"))
)