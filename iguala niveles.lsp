(defun c:ign ()
  (COMMAND "UNDO" "M")
  (COMMAND "UNDO" "C" "N")
  (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
  (prompt "iguala datos de elevaciones")
;  (setq eft (CAR (ENTSEL "\n Block Fuente de elevacion")))
  (setq ELE1 (GETREAL "\n Elevacion final del punto :"))
  (setq edt (CAR (ENTSEL "\n Block destino")))
;  (setq layer (CDR (assoc 8 (entget edt))))
;  (setq GPOCHN (ssget "X" (list (cons 0 "INSERT") (cons 2 "PUN2")))) 
;  (SETQ ELE1 (BUSATR EFT "ELEV"))
  (setq gpochn (ssadd))
  (setq gpochn (ssget '((2 . "PUN2"))))
  (SETQ ELE2 (BUSATR EDT "ELEV"))
  (SETQ DIFER (- ELE1 (ATOF ELE2)))
  (SETQ PR 0)
  (SETQ E (SSNAME GPOCHN PR))
  (WHILE E
    (SETQ ELEVA (BUSATR E "ELEV"))
    (IF (/= ELEVA NIL)
      (PROGN
        (setq bl (entnext E))
        (setq bl (entnext BL))
        (COMMAND "attedit" "" "" "" "" bl "V" "R" (RTOS (+ (ATOF ELEVA) DIFER) 2 3)"")
      )
    )
    (SETQ PR (1+ PR))
    (SETQ E (SSNAME GPOCHN PR))
  ) 
)
