(defun c:TBI ()
  (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
  (setq regm (CAR (ENTSEL "\n Selecciona el registro a corregir")))
  (setq elev1 (busatr REGM "ELEV2"))
  (setq elev2 (busatr REGM "ELEVACION"))
  (SETQ XYZ (cdr (assoc 10 (entget REGM))))
  (SETQ ELEV3 (- (ATOF ELEV2) (ATOF ELEV1)))
    (COMMAND "INSERT" "REGELEV" XYZ "" "" "")
    (SETQ ENTP(ENTLAST))
    (SETQ ENTP(ENTNEXT ENTP))
    (COMMAND "ATTEDIT" "" "" "" "" ENTP "V" "R" ELEV1 "")
    (SETQ ENTP(ENTNEXT ENTP))
    (COMMAND "ATTEDIT" "" "" "" "" ENTP "V" "R" ELEV2 "")
    (SETQ ENTP(ENTNEXT ENTP))
    (COMMAND "ATTEDIT" "" "" "" "" ENTP "V" "R" (RTOS ELEV3 2 3) "" "" "")
  (COMMAND "ERASE" REGM "")
)
