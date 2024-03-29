(DEFUN MBDDCL (LISTAOBJD ACCIONBD X1 Y1 X2 Y2 ACCIONOBJ)
  (setq repeticion (/ (strlen listaobjd) 30))
  (SETQ CONTOBJB 0)
  (setq rbusca "n")
  (repeat repeticion
    (SETQ ACCIONX (SUBSTR LISTAOBJD (+ 17 (* CONTOBJB 30)) 14))
    (if (= accionx "") (setq objf -1))
    (SETQ ACCIONX (vl-string-trim " " ACCIONX))
    (IF (= ACCIONOBJ ACCIONX) (SETQ rbusca "s"))
    (SETQ CONTOBJB (1+ CONTOBJB))
  )
  (IF (and (= rbusca "n") (= ACCIONBD "A"))
    (PROGN 
      (C:LIBRERIA "CONVIERTE NUMERO EN CADENA")
      (C:LIBRERIA "CONVIERTE CADENA EN CADENA")
      (SETQ X1 (NTOCAD X1 0 4))
      (SETQ Y1 (NTOCAD Y1 0 4))
      (SETQ X2 (NTOCAD X2 0 4))
      (SETQ Y2 (NTOCAD Y2 0 4))
      (SETQ ACCIONOBJ (CADTOCAD ACCIONOBJ " " 14))
      (SETQ LISTAOBJD (STRCAT LISTAOBJD X1 Y1 X2 Y2 ACCIONOBJ))
    )
  )  
  (IF (and (= rbusca "s") (= ACCIONBD "B"))
    (PROGN
      (SETQ OBJF 0)
      (SETQ CONTOBJB 0)
      (WHILE (= OBJF 0)
        (SETQ ACCIONX (SUBSTR LISTAOBJD (+ 17 (* CONTOBJB 30)) 14))
        (if (= accionx "") (setq objf -1))
        (SETQ ACCIONX (vl-string-trim " " ACCIONX))
	(IF (= ACCIONOBJ ACCIONX) (SETQ OBJF (1+ CONTOBJB)))
        (SETQ CONTOBJB (1+ CONTOBJB))
      )
      (if (/= objf -1)
        (progn
          (SETQ REXT (SUBSTR LISTAOBJD (+ 1 (* (1- OBJF) 30)) 30))
          (SETQ LISTAOBJD (vl-string-subst "" REXT LISTAOBJD))
        )
      )
    )
  )
 (SETQ LISTAOBJD LISTAOBJD)
)

;LISTAOBJD	CADENA		LISTA DE DATOS DE CADENA CON DESCRIPCION DE LOS OBJETOS EN EL DIALOGO
;ACCIONBD	CADENA		ACCION A EJECUTAR ALTA O BAJA? "A" "B"
;X1		ENTERO		COORDENADA XMENOR DEL OBJETO
;Y1		ENTERO		COORDENADA YMENOR DEL OBJETO
;X2		ENTERO		COORDENADA XMAYOR DEL OBJETO
;Y2		ENTERO		COORDENADA YMAYOR DEL OBJETO
;ACCIONOBJ	CADENA		NOMBRE DE LA ACCION O OBJETO DECLARADO