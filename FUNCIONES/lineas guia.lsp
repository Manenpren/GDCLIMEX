(DEFUN lineasgui (cx cy lx ly lrx lry slinprix slinsecx slinpriy slinsecy stlinprix stlinsecx stlinpriy stlinsecy clinprix clinsecx clinpriy clinsecy)
  (setq nlinprix (fix (/ (* lrx 1.000) slinprix)))
  (setq fslprix (/ lx (/ (* lrx 1.000) slinprix)))
  (setq nlinsecx (fix (/ slinprix slinsecx)))
  (setq fslsecx (/ fslprix (/ slinprix slinsecx)))
  (setq nlinpriy (fix (/ (* lry 1.000) slinpriy)))
  (setq fslpriy (/ ly (/ (* lry 1.000) slinpriy)))
  (setq nlinsecy (fix (/ slinpriy slinsecy)))
  (setq fslsecy (/ fslpriy (/ slinpriy slinsecy)))
  (setq contpri 0)
  (if (or (= stlinprix "SI") (= stlinsecx "SI"))
    (progn
      (repeat (1+ nlinprix)
        (setq dtxgp (fix (+ cx (* contpri fslprix))))
        (if (= stlinprix "SI")
          (vector_image dtxgp cy dtxgp (- cy ly) clinprix) 
        )
        (setq contpri (1+ contpri))
        (setq contsec 1)
        (if (/= contpri (1+ nlinprix))
          (repeat (1- nlinsecx)
            (setq dtxgs (fix (+ dtxgp (* contsec fslsecx))))
            (if (= stlinsecx "SI")
              (vector_image dtxgs cy dtxgs (- cy ly) clinsecx)
            )
            (setq contsec (1+ contsec))
          )
        )
      )
    )
  )
  (setq contpri 0)
  (if (or (= stlinpriy "SI") (= stlinsecy "SI"))
    (progn
      (repeat (1+ nlinpriy)
        (setq dtxgp (fix (+ (- cy ly) (* contpri fslpriy))))
        (if (= stlinpriy "SI")
          (vector_image cx dtxgp (+ cx lx) dtxgp clinpriy)
        )
        (setq contpri (1+ contpri))
        (setq contsec 1)
        (if (/= contpri (1+ nlinpriy))
          (repeat (1- nlinsecy)
            (setq dtxgs (fix (+ dtxgp (* contsec fslsecy))))
            (if (= stlinsecy "SI")
              (vector_image cx dtxgs (+ cx lx) dtxgs clinsecy)
            )
            (setq contsec (1+ contsec))
          )
        )
      )
    )
  )
)
;cx	entero		coordenada inicial izquierda inferior para lineas guia
;cy	entero
;lx	entero		longitud de la grafica
;ly	entero		longitud de la grafica
;lrx	entero		longitud real de la grafica
;lry	entero		longitud real de la grafica
;slinprix	real		separacion de las lineas primarias en unidades reales
;slinsecx	real		separacion de lineas secundarias en unidades reales
;slinpriy	real		separacion de las lineas primarias en unidades reales
;slinsecy	real		separacion de lineas secundarias en unidades reales
;stlinprix	cadena		visible o no visible en lineas primarios ("SI" "NO")
;stlinsecx	cadena		visible o no visible en lineas secundarios ("SI" "NO")
;stlinpriy	cadena		visible o no visible en lineas primarios ("SI" "NO")
;stlinsecy	cadena		visible o no visible en lineas secundarios ("SI" "NO")
;clinprix	entero		color de las lineas primarias
;clinsecx	entero		color de las lineas secundarias
;clinpriy	entero		color de las lineas primarias
;clinsecy	entero		color de las lineas secundarias