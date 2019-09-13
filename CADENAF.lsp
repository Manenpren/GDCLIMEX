(defun C:CADENA3 ()
  (command "undo" "m")
  (C:LIBRERIA "VERTICES DE UNA LWPOLYLINE")
  (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
  (IF (= COMPLEMENTO NIL) (SETQ COMPLEMENTO ""))
  (COMMAND "LUNITS" 2)
  (COMMAND "LUPREC" 7)
  (COMMAND "AUNITS" 0)
  (COMMAND "AUPREC" 4)
  (COMMAND "ANGDIR" 0)
  (COMMAND "ANGBASE" 0.0)
  (COMMAND "DIMZIN" 0)
  (SETQ OPCIONESOS (GETVAR "OSMODE"))
  (command "osnap" "none")
  (SETQ E (CAR (ENTSEL "\n SELLECCIONA LA LINEA A ACOTAR")))
  (SETQ PROV 1)
  (SETQ PT (VERTICE E PROV))
  (SETQ DISTANCIA 0)
  (WHILE PT
     (SETQ PT2 PT)
     (SETQ PT (VERTICE E PROV))
     (SETQ PROV (1+ PROV))
     (SETQ DST (DISTANCE PT PT2))
     (SETQ DISTANCIA (+ DISTANCIA DST))
    (setq aNG (angle PT2 PT))
    (setq aNG (* 180 (/ aNG pi)))
;    (IF (> ANG 180)
;      (SETQ ANG (+ ANG 180))
;    )
    (SETQ PUNVER PT)
    (setq punver1 (suma PT -0.01 -0.01))                         ;BUSQUEDA DE  BLOCKS
    (setq punver2 (suma PT 0.01 0.01))
    (command "ZOOM" "W" punver1 punver2)
    (setq GpoPun (ssget "C" punver1 punver2))
    (setq ElevA Elev)
    (setq DisA DisAc)
    (setq cuenta2 0)
    (setq elev nil)
;    (setq elev "1")                                                 ;cambio de niveles
;    (while (= elev nil)
;      (setq nomobj (ssname gpopun cuenta2))
;      (SETQ PV (cdr (assoc 10 (entget nomobj))))
;      (SETQ XV (CAR PV))
;      (SETQ YV (CADR PV))
;      (SETQ X1 (CAR PUNVER))
;      (SETQ Y1 (CADR PUNVER))
;      (if (= "INSERT" (cdr (assoc 0 (entget nomobj))))
;       (progn
;        (if (OR (= (STRCASE (cdr (assoc 2 (entget nomobj)))) "PUN2") (= (STRCASE (cdr (assoc 2 (entget nomobj)))) "CADEN"))
;         (IF (AND (= (RTOS XV 2 2) (RTOS X1 2 2)) (= (RTOS YV 2 2) (RTOS Y1 2 2)))
;          (progn
;            (setq elev (BUSATR NOMOBJ "ELEV"))                       ;NOMBRE DEL ATTRIBUTO
;            (IF (= ELEV NIL)
;              (setq elev (BUSATR NOMOBJ "ELEVACION"))                       ;NOMBRE DEL ATTRIBUTO
;            )
;            (setq ANGL (/ (* 180 (cdr (assoc 50 (entget nomobj)))) PI))
;          )
;         )
;        )
;       )
;      )
;      (setq cuenta2 (+ cuenta2 1))
;    )

    (IF (= PROV 2)
     (PROGN
      (SETQ PTX (VERTICE E 1))
      (COMMAND "INSERT" (STRCAT RUTA "BLOCKS\\CADEN2.dwg") PTX "" "" ANG "" "" "" "" "" "" "" "")
;        (SETQ EX (ENTLAST))
;        (SETQ ENTP (ENTNEXT EX))
;        (SETQ ENTP (ENTNEXT ENTP))
;        (COMMAND "ATTEDIT" "" "" "" "" ENTP "V" "R" "ELEV" "")
;        (SETQ ELEV NIL)
     )
    )
        
 
    (COMMAND "INSERT" (STRCAT RUTA "BLOCKS\\CADEN2.dwg") PT "" "" ANG "" "" "" "" "" "" "" "")
      (SETQ EX (ENTLAST))
      (COMMAND "EXPLODE" EX "")
      (SETQ GPOPROV (SSADD))
      (SETQ GPOPROV (SSGET "P"))
      (setq e2 (ssname gpoprov 0))
      (setq nent 1)
      (while e2
        (if (= "TEXT" (cdr (assoc 0 (entget E2))))
         (progn
            (setq nte (STRCAT (cottopo DISTANCIA) COMPLEMENTO))
            (entmod (subst (cons 1 nte) (assoc 1 (entget e2)) (entget e2)))
          )
        )
        (setq e2 (ssname gpoprov nent))
        (setq nent (1+ nent))
      )
    )
  (SETVAR "OSMODE" OPCIONESOS)
)

(defun cottopo (numero)
   (setq nombre (rtos numero 2 0))
   (setq nombre (rtos (/ (atof nombre) 1000) 2 7))
    (SETQ LNG (STRLEN NOMBRE))
    (SETQ NOMBLO "")
    (SETQ CONT 0)
    (REPEAT LNG
        (SETQ CONT (1+ CONT))
        (setq CARACTER (substr NOMBRE CONT 1))
        (IF (= CARACTER ".") (SETQ CARACTER "+"))
        (setq nomblo (STRCAT NOMBLO CARACTER))
    )
  (setq nomblo (strcat (substr nomblo 1 (- lng 4)) "." (substr nomblo (- lng 3) 3)))
  (setq lng (1+ lng))
  (if (= (substr nomblo (- lng 3) 3) "000") (setq nomblo (substr nomblo 1 (- lng 5))))
  (setq nuetex nomblo)
)

(defun SUMA (punto xx yy)
  (setq x (car punto))
  (setq y (car (cdr punto)))
  (setq xxx (+ x xx))
  (setq yyy (+ y yy))
  (list xxx yyy)
)