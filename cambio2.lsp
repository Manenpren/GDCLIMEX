(defun c:CAM2 ()
  (COMMAND "UNDO" "M")
  (COMMAND "VIEW" "S" "C")
  (C:LIBRERIA "busca block en base de datos")
  (C:LIBRERIA "ZOOM ULTIMO OBJETO INSERTADO")
  (COMMAND "LUNITS" 2)
  (COMMAND "LUPREC" 7)
  (COMMAND "AUNITS" 0)
  (COMMAND "AUPREC" 4)
  (COMMAND "ANGDIR" 0)
  (COMMAND "ANGBASE" 0.0)
  (COMMAND "DIMZIN" 0)
  (SETQ OPCIONESOS (GETVAR "OSMODE"))
  (command "osnap" "none")
  (setq BLOCK (CAR (ENTSEL "SELECCIONA BLOCK")))
  (setq NOMBLO (cdr (assoc 2 (entget block))))
  (setq nb2 nomblo)
  (COMMAND "INSERT" NOMBLO "0,0" "" "" "")
  (SETQ X (ENTLAST))
  (ZBLOCK)
  (QUITA)
  (setq texto (CAR (ENTSEL "SELECCIONA texto")))
  (SETQ CADENAC (+ 2750 (ATOF CADENAC)))
  (setq cadd (rtos cadenaC 2 0))
  (setq nte (cottopo (atof cadd)))
  (setq nte2 (cottopo2 (atof cadd)))
  (entmod (subst (cons 1 nte) (assoc 1 (entget TEXTO)) (entget TEXTO)))
  (COMMAND "BLOCK" NTE2 "0,0" GPOA "")
  (COMMAND "ZOOM" "P")
  (COMMAND "ERASE" BLOCK "" "PURGE" "B" NB2 "N")
)

(defun cottopo (numero)
   (setq nombre (rtos numero 2 3))
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

(DEFUN QUITA ()
    (SETQ LNG (STRLEN NOMBLO))
    (SETQ CADENAC "")
    (SETQ CONT 0)
    (REPEAT LNG
        (SETQ CONT (1+ CONT))
        (setq CARACTER (substr NOMBLO CONT 1))
        (IF (= CARACTER "-") (SETQ CARACTER ""))
        (setq CADENAC (STRCAT CADENAC CARACTER))
    )
;  (if (= (substr nomblo (- lng 3) 3) "000") (setq nomblo (substr nomblo 1 (- lng 5))))
)

(defun cottopo2 (numero)
   (setq nombre (rtos numero 2 3))
   (setq nombre (rtos (/ (atof nombre) 1000) 2 7))
    (SETQ LNG (STRLEN NOMBRE))
    (SETQ NOMBLO "")
    (SETQ CONT 0)
    (REPEAT LNG
        (SETQ CONT (1+ CONT))
        (setq CARACTER (substr NOMBRE CONT 1))
        (IF (= CARACTER ".") (SETQ CARACTER "-"))
        (setq nomblo (STRCAT NOMBLO CARACTER))
    )
  (setq nomblo (strcat (substr nomblo 1 (- lng 4)) "." (substr nomblo (- lng 3) 3)))
  (setq lng (1+ lng))
  (if (= (substr nomblo (- lng 3) 3) "000") (setq nomblo (substr nomblo 1 (- lng 5))))
  (setq nuetex nomblo)
)