(DEFUN blocktopto (COORDENADA rango)
  (setq punver1 (suma coordenada (* rango -1) (* rango -1)))
  (setq punver2 (suma coordenada rango rango))
  (command "ZOOM" "W" punver1 punver2)
  (setq GpoPun (ssget "C" punver1 punver2))
  (command "ZOOM" "P")
  (setq cuenta2 0)
  (setq elev nil)
  (repeat (sslength gpopun)
    (setq nomobj (ssname gpopun cuenta2))
    (SETQ PV (cdr (assoc 10 (entget nomobj))))
    (SETQ XV (CAR PV))
    (SETQ YV (CADR PV))
    (SETQ X1 (CAR coordenada))
    (SETQ Y1 (CADR coordenada))
    (if (= "INSERT" (cdr (assoc 0 (entget nomobj))))
     (progn
       (IF (AND (= (RTOS XV 2 2) (RTOS X1 2 2)) (= (RTOS YV 2 2) (RTOS Y1 2 2)))
         (setq elev nomobj)
       )
     )
    )
    (setq cuenta2 (+ cuenta2 1))
  )
  (setq bloque elev)
)

(defun SUMA (punto xx yy)
  (setq x (car punto))
  (setq y (car (cdr punto)))
  (setq xxx (+ x xx))
  (setq yyy (+ y yy))
  (list xxx yyy)
)