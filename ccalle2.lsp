(defun C:CC2 ()
    (setq block (car (entsel "primer block : ")))
    (setq xyz2 (getpoint "dame el punto en donde insertar" ))
    (setq xyz (cdr (assoc 10 (entget block))))
    (SETQ Y (CADR xyz))
    (SETQ Y (RTOS Y 2 5))
    (SETQ X (CAR xyz))
    (SETQ X (RTOS X 2 5))
    (SETQ Y2 (CADR xyz2))
    (SETQ Y2 (RTOS Y2 2 5))
    (SETQ X2 (CAR xyz2))
    (SETQ X2 (RTOS X2 2 5))
    (setq elev1 (busatr block "ELEV"))
    (setq elev2 (RTOS (+ (ATOF ELEV1) 0.04) 2 3))
    (setq elev3 (RTOS (+ (ATOF ELEV1) 1) 2 3))
    (COMMAND "INSERT" "PUN2" XYZ2 "0.25" "" "" "XXX" ELEV2 "XXX" "" "" "")
    (SETQ BLOCK (ENTLAST))
    (setq a (angle XYZ XYZ2))
    (setq a (* 180 (/ a pi)))
    (command "snap" "ro" XYZ a)
    (command "snap" "off")
    (COMMAND "ARRAY" BLOCK "" "R" "" "2" ".001" )
    (SETQ XE (ENTLAST))
    (command "change" XE "" "p" "la" "inter" "")
    (SETQ XE (ENTNEXT XE))
    (SETQ XE (ENTNEXT XE))
    (COMMAND "ATTEDIT" "" "" "" "" XE "VALUE" "" ELEV3 "" "")
    (command "snap" "ro" "0,0" "0")
    (command "snap" "off")
)

(DEFUN BUSATR (E ATR)
 (SETQ E (ENTNEXT E))
 (SETQ R 0)
 (WHILE (= "ATTRIB" (cdr (assoc 0 (entget E))))
   (if (= "ATTRIB" (cdr (assoc 0 (entget E))))
      (if (= ATR (cdr (assoc 2 (entget E))))
       (PROGN
        (setq vALAT (cdr (assoc 1 (entget E))))
       )
      )
   )
   (SETQ R (1+ R))
   (SETQ E (ENTNEXT E))
 )
 (PRINT ValAT)
)
