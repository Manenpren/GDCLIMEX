(DEFUN graficax (ax,ay,realx,realy,cx,cy,crx,cry,tablagrf,anchox,anchoy,vajustx,vajusty,varini,tipogrf,colores,degradado)
  (C:LIBRERIA "tranforma coordenadas dibujo im dconcatenados")
  (setq ndatgrf (/ (strlen tablagrf) (+ anchox anchoy)))
  (setq contgrf 0)
  (if (or (= degradado "SI") (= vajustx "SI") (= vajusty "SI"))
    (progn 
      (setq mingrfx nil)
      (setq mingrfy nil)
      (setq maxgrfx nil)
      (setq maxgrfy nil)
      (repeat ndatgrf
        (setq datextx (substr tablagrf (1+ (* contgrf (+ anchox anchoy)))))
        (setq datexty (substr tablagrf (1+ (+ (* contgrf (+ anchox anchoy)) anchox))))
        (if (= contgrf 1)
          (progn
	    (setq mingrfx datextx)
            (setq mingrfy datexty)
            (setq maxgrfx datextx)
            (setq maxgrfy datexty)
	  )
        )
        (if (> datextx maxgrfx) (setq maxgrfx datextx))
        (if (< datextx mingrfx) (setq mingrfx datextx))
        (if (> datexty maxgrfy) (setq maxgrfy datexty))
        (if (< datexty mingrfy) (setq mingrfy datexty))
        (setq contgrf (1+ contgrf))
      )
    )
  )
  (setq cprovx nil)
  (setq cprovx2 nil)
  (setq cprovx3 nil)
  (setq cprovx4 nil)
  (setq cprovy nil)
  (setq cprovy2 nil)
  (setq cprovy3 nil)
  (setq cprovy4 nil)
  (if (= vajustx "SI")
    (progn
      (setq cprovx (/ (- maxgrfx mingrfx) ax))
      (if (>= cprovx 1)
        (progn
          (setq cprovx2 (- cprovx (fix cprovx)))
        )
        (progn
          (setq cprovx3 (/ ax (- maxgrfx mingrfx)))
          (setq cprovx4 (- cprovx3 (fix cprovx3)))
        )
      )
      (setq realx (- maxgrfx mingrfx))
    )
  )
  (if (= vajusty "SI")
    (progn
      (setq cprovy (/ (- maxgrfy mingrfy) ay))
      (if (>= cprovy 1)
        (progn
          (setq cprovy2 (- cprovy (fix cprovy)))
        )
        (progn
          (setq cprovy3 (/ ay (- maxgrfy mingrfy)))
          (setq cprovy4 (- cprovy3 (fix cprovy3)))
        )
      )
      (setq realy (- maxgrfy mingrfy))
    )
  )
  (SETQ MATRIZDIBUgrf (TRFCOR tablagrf ax ay crx cry (+ crx realx) (+ cry realy) cx cy anchox anchoy))
  (if (= degradado "SI")
    (setq intervalodeg (/ realy 5))
    (progn
      (setq intervalodeg nil)
      (setq colorprv colores)
    )
  )
  (setq contgrf 1)
  (if (= tipogrf "DS")
    (repeat ndatgrf
      (setq verpolgrf (cdr (assoc contgrf MATRIZDIBUgrf)))
      (setq datextx (car verpolgrf))
      (setq datexty (cadr verpolgrf))
      (if (= degradado "SI")
        (setq colorprv (dcolor datexty))
      )
      (vector_image datextx datexty datextx datexty (atoi colorprv))
      (setq contgrf (1+ contgrf))
    )
  )
;  (if (= tipogrf "BR")
;  )
  (setq contgrf 1)
  (if (= tipogrf "LI")
    (progn
      (repeat ndatgrf
        (setq verpolgrf (cdr (assoc contgrf MATRIZDIBUgrf)))
        (setq datextx (car verpolgrf))
        (setq datexty (cadr verpolgrf))
        (if (= degradado "SI")
          (setq colorprv (dcolor datexty))
        )
        (if (> contgrf 1)
          (vector_image datextx2 datexty2 datextx datexty (atoi colorprv))
        )
        (setq contgrf (1+ contgrf))
	(setq verpolgrf2 verpolgrf)
        (setq datextx2 datextx)
        (setq datexty2 datexty)
      )
    )
  )
  (setq contgrf nil)
)

(defun dcolor (elev)
  (setq vprovd (/ elev intervalodeg))
  (setq vprovd (1+ (*3 (fix vprovd))))
  (setq vprovd (substr colores vprovd 3))
)

;        (fill_image 0 0 width height 0)   
;          (vector_image 40 180 560 180 (atoi cret)) 

;ax	entero		ancho de la grafica
;ay	entero
;realx	real		ancho real de la grafica
;realy	real
;'cx	entero		coordenada inicial para graficar superior izquierda
;cy	entero
;crx	real		coordenada inicial del punto de partida de la grafica en coordenadas reales inferior izquierda
;cry	real
;tablagrf	cadena		listado de datos a graficar
;anchox		entero		ancho de los caracteres
;anchoy		entero
;vajustx	cadena		ajustar el ancho de la grafica SI o NO
;vajusty	cadena
;varini		entero		numero de dato a empezar a graficar
;tipogrf	cadena		tipo de grafico "dispersion, barras o linea continua(DS,BR,LI)"
;colores	cadena		si degradado no colores= 1 color lo contrario colores = "color...color5" donde color 3 caracteres 
;degradado	cadena		degradado SI o NO