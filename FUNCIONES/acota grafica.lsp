(DEFUN acotagrf (cx cy l lreal inireal slinpri slinsec netikpri netiksec htxtpri htxtsec stxtpri stxtsec clinpri clinsec stlinpri stlinsec lglinpri lglinsec orlin ftpri ftsec ndecpri ndecsec)
  (C:LIBRERIA "escribe texto img")
  (setq nlinpri (fix (/ lreal slinpri)))
  (setq fslpri (/ l (/ lreal slinpri)))
  (setq nlinsec (fix (/ slinpri slinsec)))
  (setq fslsec (/ fslpri (/ slinpri slinsec)))
  (setq contpri 0)
  (setq contlpri 0)
  (setq contlsec 0)
  (if (= orlin "X")
    (progn
      (if (or (= stlinpri 1) (= stlinpri 2))
        (progn
          (setq dtYini (- cy (/ lglinpri 2)))
          (setq dtYfin (+ cy (/ lglinpri 2)))
          (if (= stlinpri 1)
            (setq dtYtxt (+ cy (/ lglinpri 2) 2))
          )
          (if (= stlinpri 2)
            (setq dtYtxt (- cy (/ lglinpri 2) 2 htxtpri))
          )
        )
      )
      (if (= stlinpri 3)
        (progn
          (setq dtYini cy)
          (setq dtYfin (- cy lglinpri))
          (setq dtYtxt (- cy lglinpri 2 htxtpri))
        )
      )
      (if (= stlinpri 4)
        (progn
          (setq dtYini cy)
          (setq dtYfin (+ cy lglinpri))
          (setq dtYtxt (+ cy lglinpri 2))
        )
      )
      (if (or (= stlinsec 1) (= stlinsec 2))
        (progn
          (setq dtYini2 (- cy (/ lglinsec 2)))
          (setq dtYfin2 (+ cy (/ lglinsec 2)))
          (if (= stlinsec 1)
            (setq dtYtxt2 (+ cy (/ lglinsec 2) 2))
          )
          (if (= stlinsec 2)
            (setq dtYtxt2 (- cy (/ lglinsec 2) 2 htxtsec))
          )
        )
      )
      (if (= stlinsec 3)
        (progn
          (setq dtYini2 cy)
          (setq dtYfin2 (- cy lglinsec))
          (setq dtYtxt2 (- cy lglinsec 2 htxtsec))
        )
      )
      (if (= stlinsec 4)
        (progn
          (setq dtYini2 cy)
          (setq dtYfin2 (+ cy lglinsec))
          (setq dtYtxt2 (+ cy lglinsec 2))
        )
      )
      (repeat (1+ nlinpri)
        (setq dtxgp (fix (+ cx (* contpri fslpri))))
        (vector_image dtxgp dtyini dtxgp dtyfin clinpri) 
        (setq vxg (rtos (+ inireal (* contpri slinpri)) 2 0))
        (if (and (= contlpri 0) (= stxtpri "SI"))
          (stexto vxg ftpri htxtpri (fix (- dtxgp (* (strlen vxg) 0.25 htxtpri))) dtytxt)
        )
        (setq contlpri (1+ contlpri))
        (if (= contlpri netikpri) (setq contlpri 0))
        (setq contpri (1+ contpri))
        (setq contsec 1)
        (if (/= contpri (1+ nlinpri))
          (repeat (1- nlinsec)
            (setq dtxgs (fix (+ dtxgp (* contsec fslsec))))
            (vector_image dtxgs dtyini2 dtxgs dtyfin2 clinsec)
            (setq vxg (rtos (+ inireal (* (1- contpri) slinpri) (* contsec slinsec)) 2 2))
            (if (and (= contlsec 0) (= stxtsec "SI"))
              (stexto vxg ftsec htxtsec (fix (- dtxgs (* (strlen vxg) 0.25 htxtsec))) dtytxt2)
            )
            (setq contlsec (1+ contlsec))
            (if (= contlsec netiksec) (setq contlsec 0))
            (setq contsec (1+ contsec))
          )
        )
      )
    )
  )
  (if (= orlin "Y")
    (progn
      (if (or (= stlinpri 1) (= stlinpri 2))
        (progn
          (setq dtYini (- cx (/ lglinpri 2)))
          (setq dtYfin (+ cx (/ lglinpri 2)))
          (if (= stlinpri 1)
            (setq dtYtxt (fix (- cx (/ lglinpri 2) 3 (* (strlen (rtos lreal 2 2)) 0.25 htxtpri))))
          )
          (if (= stlinpri 2)
            (setq dtYtxt (fix (+ cx (/ lglinpri 2) 3)))
          )
        )
      )
      (if (= stlinpri 3)
        (progn
          (setq dtYini cx)
          (setq dtYfin (- cx lglinpri))
          (setq dtYtxt (fix (- cx lglinpri 3 (* (strlen (rtos lreal 2 2)) 0.25 htxtpri))));ndecpri
        )
      )
      (if (= stlinpri 4)
        (progn
          (setq dtYini cx)
          (setq dtYfin (+ cx lglinpri))
          (setq dtYtxt (+ cx lglinpri 3))
        )
      )
      (if (or (= stlinsec 1) (= stlinsec 2))
        (progn
          (setq dtYini2 (- cx (/ lglinsec 2)))
          (setq dtYfin2 (+ cx (/ lglinsec 2)))
          (if (= stlinsec 1)
            (setq dtYtxt2 (fix (- cx (/ lglinsec 2) 3 (* (strlen (rtos lreal 2 2)) 0.25 htxtsec))))
          )
          (if (= stlinsec 2)
            (setq dtYtxt2 (fix (+ cx (/ lglinsec 2) 3)))
          )
        )
      )
      (if (= stlinsec 3)
        (progn
          (setq dtYini2 cx)
          (setq dtYfin2 (- cx lglinsec))
          (setq dtYtxt2 (fix (- cx lglinsec 3 (* (strlen (rtos lreal 2 2)) 0.25 htxtsec))))
        )
      )
      (if (= stlinsec 4)
        (progn
          (setq dtYini2 cx)
          (setq dtYfin2 (+ cx lglinsec))
          (setq dtYtxt2 (+ cx lglinsec 3))
        )
      )
      (repeat (1+ nlinpri)
        (setq dtxgp (fix (+ (- cy l) (* contpri fslpri))))
        (vector_image dtyini dtxgp dtyfin dtxgp clinpri) 
        (setq vxg (rtos (- lreal (* contpri slinpri)) 2 2))
        (if (and (= contlpri 0) (= stxtpri "SI"))
          (stexto vxg ftpri htxtpri dtytxt (fix (- dtxgp (* (strlen vxg) 0.25 htxtpri))))
        )
        (setq contlpri (1+ contlpri))
        (if (= contlpri netikpri) (setq contlpri 0))
        (setq contpri (1+ contpri))
        (setq contsec 1)
        (if (/= contpri (1+ nlinpri))
          (repeat (1- nlinsec)
            (setq dtxgs (fix (+ dtxgp (* contsec fslsec))))
            (vector_image dtyini2 dtxgs dtyfin2 dtxgs clinsec)
            (setq vxg (rtos (- lreal (* (1- contpri) slinpri) (* contsec slinsec)) 2 2))
            (if (and (= contlsec 0) (= stxtsec "SI"))
              (stexto vxg ftsec htxtsec dtytxt2 (fix (- dtxgs (* (strlen vxg) 0.25 htxtsec))))
            )
            (setq contlsec (1+ contlsec))
            (if (= contlsec netiksec) (setq contlsec 0))
            (setq contsec (1+ contsec))
          )
        )
      )
    )
  )
)

;cx	entero		coordenada inicial donde acotar (dato izquierdo, o dato superior)
;cy	entero
;l	entero		longitud de la grafica
;lreal	real		longitud real de las acotaciones
;inireal	real		inicio real de la grafica
;slinpri	real		separacion de las lineas primarias en unidades reales
;slinsec	real		separacion de lineas secundarias en unidades reales
;nlinpri	entero		numero de espacios en lineas primarias a dibujar
;nlinsec	entero		numero de espacios en lineas secundarias a dibujar entre  2 lineas primarias es decir cuantas lineas secundarias hay en medio de las primarias
;netikpri	entero		Etiquetar a cada # de lineas en lineas primarias
;netiksec	entero		Etiquetar a cada # de lineas en lineas secundarias
;htxtpri	entero		altura del texto primario
;htxtsec	entero		altura del texto secundario
;stxtpri	cadena		visible o no visible en textos primarios ("SI" "NO")
;stxtsec	cadena		visible o no visible en textos secundarios ("SI" "NO")
;clinpri	entero		color de las lineas primarias
;clinsec	entero		color de las lineas secundarias
;stlinpri	entero		estilo de linea primario (1,2,3,4) segun alineacion de las lineas 
;caso x(1=centrado textos abajo) (2=centrado textos arriba) (3=hacia arriba textos arriba) (4=hacia abajo textos abajo)
;caso y(1=centrado textos izquierda) (2=centrado textos derecha) (3=derecha textos derecha) (4=izquierda textos izquierda)
;stlinsec	entero		estilo de linea secundario (1,2,3,4) segun alineacion de las lineas 
;lglinpri	entero		longitud de la las lineas primarias
;lglinsec	entero		longitud de la las lineas secundarias
;orlin		cadena		orientacion de la linea a acotar ("X" o "Y")
;ftpri		cadena		fuente para lineas primarias
;ftsec		cadena		fuente para lineas secundarias
;ndecpri	entero		numero de decimales mostrados en los textos primarios
;ndecsec	entero		numero de decimales mostrados en los textos secundarios