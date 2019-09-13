(DEFUN MBDDCL2 (LISTAOBJD ACCIONBD X1 Y1 X2 Y2 ACCIONOBJ tipoobj status rutaimg1 rutaimg2 rutaimg3 rutaimg4 ancho alto listado)
  (IF (OR (= tipoobj "A") (= tipoobj "B") (= tipoobj "X") (= tipoobj "F") (= tipoobj "G"))
    (setq ancholinea 74)
    (setq ancholinea 274)
  )
  (setq repeticion (/ (strlen listaobjd) ancholinea))
  (SETQ CONTOBJB 0)
  (setq rbusca "n")
  (repeat repeticion
    (SETQ ACCIONX (SUBSTR LISTAOBJD (+ 17 (* CONTOBJB ancholinea)) 14))
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
      (IF (OR (= tipoobj "A") (= tipoobj "B") (= tipoobj "X") (= tipoobj "F") (= tipoobj "G"))
        (SETQ LISTAOBJD (STRCAT LISTAOBJD X1 Y1 X2 Y2 ACCIONOBJ tipoobj status (CADTOCAD rutaimg1 " " 14) (CADTOCAD rutaimg2 " " 14) (CADTOCAD rutaimg3 " " 14)))
        (SETQ LISTAOBJD (STRCAT LISTAOBJD X1 Y1 X2 Y2 ACCIONOBJ tipoobj status (CADTOCAD rutaimg1 " " 14) (CADTOCAD rutaimg2 " " 14) (CADTOCAD rutaimg3 " " 14) (CADTOCAD rutaimg4 " " 14) (nTOCAD ancho 0 3) (nTOCAD alto 0 3) (CADTOCAD listado " " 160) "10000000000000000000"))
      )
    )
  )  
  (IF (and (= rbusca "s") (= ACCIONBD "B"))
    (PROGN
      (SETQ OBJF 0)
      (SETQ CONTOBJB 0)
      (WHILE (= OBJF 0)
        (SETQ ACCIONX (SUBSTR LISTAOBJD (+ 17 (* CONTOBJB ancholinea)) 14))
        (if (= accionx "") (setq objf -1))
        (SETQ ACCIONX (vl-string-trim " " ACCIONX))
	(IF (= ACCIONOBJ ACCIONX) (SETQ OBJF (1+ CONTOBJB)))
        (SETQ CONTOBJB (1+ CONTOBJB))
      )
      (if (/= objf -1)
        (progn
          (SETQ REXT (SUBSTR LISTAOBJD (+ 1 (* (1- OBJF) ancholinea)) ancholinea))
          (SETQ LISTAOBJD (vl-string-subst "" REXT LISTAOBJD))
        )
      )
    )
  )
 (SETQ LISTAOBJD LISTAOBJD)
)

(DEFUN BUSOBJBD (LISTAOBJD ANCHOLINEA ACCIONOBJ)
  (setq repeticion (/ (strlen listaobjd) ancholinea))
  (SETQ CONTOBJB 0)
  (setq rbusca "n")
  (SETQ ACCIONX "")
  (SETQ RESULTADO "")
  (WHILE (AND (= RESULTADO "") (< CONTOBJB REPETICION))
    (SETQ ACCIONX (SUBSTR LISTAOBJD (+ 17 (* CONTOBJB ancholinea)) 14))
    (if (= accionx "") (setq objf -1))
    (SETQ ACCIONX (vl-string-trim " " ACCIONX))
    (IF (= ACCIONOBJ ACCIONX) (SETQ RESULTADO (SUBSTR LISTAOBJD (+ 1 (* CONTOBJB ancholinea)) ANCHOLINEA)))
    (SETQ CONTOBJB (1+ CONTOBJB))
  )
  (SETQ RESULTADO RESULTADO)
)

(DEFUN ACTUALIZABD (LISTAOBJD ANCHOLINEA ACCIONOBJ LINEAFIN)
  (setq repeticion (/ (strlen listaobjd) ancholinea))
  (SETQ CONTOBJB 0)
  (setq rbusca "n")
  (SETQ ACCIONX "")
  (SETQ RESULTADO "")
  (WHILE (AND (= RESULTADO "") (< CONTOBJB REPETICION))
    (SETQ ACCIONX (SUBSTR LISTAOBJD (+ 17 (* CONTOBJB ancholinea)) 14))
    (if (= accionx "") (setq objf -1))
    (SETQ ACCIONX (vl-string-trim " " ACCIONX))
    (IF (= ACCIONOBJ ACCIONX) (SETQ RESULTADO (SUBSTR LISTAOBJD (+ 1 (* CONTOBJB ancholinea)) ANCHOLINEA)))
    (SETQ CONTOBJB (1+ CONTOBJB))
  )
  (SETQ LISTAOBJD (vl-string-subst LINEAFIN RESULTADO LISTAOBJD))
)
;LISTAOBJD	CADENA		LISTA DE DATOS DE CADENA CON DESCRIPCION DE LOS OBJETOS EN EL DIALOGO
;ACCIONBD	CADENA		ACCION A EJECUTAR ALTA O BAJA? "A" "B"
;X1		ENTERO		COORDENADA XMENOR DEL OBJETO
;Y1		ENTERO		COORDENADA YMENOR DEL OBJETO
;X2		ENTERO		COORDENADA XMAYOR DEL OBJETO
;Y2		ENTERO		COORDENADA YMAYOR DEL OBJETO
;ACCIONOBJ	CADENA		NOMBRE DE LA ACCION O OBJETO DECLARADO