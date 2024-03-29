(DEFUN dibujaelem (listaobjd)
  (SETQ X1 (ATOI (SUBSTR LISTAOBJD 1 4)))
  (SETQ Y1 (ATOI (SUBSTR LISTAOBJD 5 4)))
  (SETQ X2 (ATOI (SUBSTR LISTAOBJD 9 4)))
  (SETQ Y2 (ATOI (SUBSTR LISTAOBJD 13 4)))
  (SETQ ACCIONX (SUBSTR LISTAOBJD 17 14))
  (SETQ tipoobj (SUBSTR LISTAOBJD 31 1))
  (SETQ status (SUBSTR LISTAOBJD 32 1))
  (SETQ slide1 (vl-string-trim " " (SUBSTR LISTAOBJD 33 14)))
  (SETQ slide2 (vl-string-trim " " (SUBSTR LISTAOBJD 47 14)))
  (SETQ slide3 (vl-string-trim " " (SUBSTR LISTAOBJD 61 14)))
  (if (or (= tipoobj "C") (= tipoobj "D") (= tipoobj "H"))
    (progn
      (SETQ slide4 (SUBSTR LISTAOBJD 75 14))
      (SETQ ancho (SUBSTR LISTAOBJD 89 3))
      (SETQ alto (SUBSTR LISTAOBJD 92 3))
      (SETQ listax (vl-string-trim " " (SUBSTR LISTAOBJD 95 160)))
      (SETQ listax2 (SUBSTR LISTAOBJD 255 20))
      (IF (/= TIPOOBJ "H")
        (PROGN
          (fill_image X1 Y1 (- x2 x1) 20 105)
          (fill_image X1 (+ Y1 20) (- x2 x1) (- y2 y1 20) 31)
        )
      )
      (slide_image x1 y1 (- x2 x1) (- y2 y1) (STRCAT RUTA "SLIDES\\" slide4 ".SLD"))
      (IF (= TIPOOBJ "D")
        (dibujaop2 listax listax2)
        (dibujaop listax listax2)
      )
    )
  )
  (if (= tipoobj "F")
    (progn
      (if (= status "0") (PROGN (setq slidexx slide1) (fill_image x1 y1 (- x2 x1) (- y2 y1) 0)))
      (if (= status "1") (PROGN (setq slidexx slide2) (fill_image x1 y1 (- x2 x1) (- y2 y1) 0)))
      (if (= status "2") (PROGN (setq slidexx slide3) (fill_image x1 y1 (- x2 x1) (- y2 y1) 0)))
      (slide_image x1 y1 (- x2 x1) (- y2 y1) (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
    )
  )
  (if (= tipoobj "B")
    (progn
      (if (= status "0") (PROGN (setq slidexx slide1) (fill_image (+ X1 3) (+ Y1 3) (- x2 x1 6) (- y2 y1 6) 105)))
      (if (= status "1") (PROGN (setq slidexx slide2) (fill_image (+ X1 3) (+ Y1 3) (- x2 x1 6) (- y2 y1 6) 107)))
      (if (= status "2") (PROGN (setq slidexx slide3) (fill_image (+ X1 3) (+ Y1 3) (- x2 x1 6) (- y2 y1 6) 105)))
      (slide_image x1 y1 (- x2 x1) (- y2 y1) (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
    )
  )
  (if (= tipoobj "G")
    (progn
      (if (= status "0") (PROGN (setq slidexx slide1) (fill_image (+ X1 1) (+ Y1 1) (- x2 x1 1) (- y2 y1 1) 140)))
      (if (= status "1") (PROGN (setq slidexx slide2) (fill_image (+ X1 1) (+ Y1 1) (- x2 x1 1) (- y2 y1 1) 140)))
      (if (= status "2") (PROGN (setq slidexx slide3) (fill_image (+ X1 1) (+ Y1 1) (- x2 x1 1) (- y2 y1 1) 105)))
      (slide_image x1 y1 (- x2 x1) (- y2 y1) (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
    )
  )
  (if (= tipoobj "A")
    (progn
      (if (= status "0") (setq slidexx slide1))
      (if (= status "2") (setq slidexx slide3))
      (slide_image x1 y1 (- x2 x1) (- y2 y1) (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
    )
  )
)

(defun dibujaop (listactn listactn2)
  (setq nbot (/ (strlen listactn) 8))
  (setq contop 1)
  (repeat nbot
    (setq coord (substr listactn (1+ (* (1- contop) 8)) 8))
    (setq stdibuj (substr listactn2 contop 1))
    (setq coordx (substr coord 1 4))
    (setq coordy (substr coord 5 4))
    (if (= stdibuj "0") (setq slidexx slide1))
    (if (= stdibuj "1") (setq slidexx slide2))
    (if (= stdibuj "2") (setq slidexx slide3))
    (slide_image (atoi coordx) (atoi coordy) (atoi ancho) (atoi alto) (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
    (setq contop (1+ contop))
  )
)

(defun dibujaop2 (listactn listactn2)
  (setq nbot (/ (strlen listactn) 8))
  (setq contop 1)
  (repeat nbot
    (setq coord (substr listactn (1+ (* (1- contop) 8)) 8))
    (setq stdibuj (substr listactn2 contop 1))
    (setq coordx (substr coord 1 4))
    (setq coordy (substr coord 5 4))
    (if (= stdibuj "0") (setq slidexx slide1))
    (if (= stdibuj "1") (setq slidexx slide2))
    (if (= stdibuj "2") (setq slidexx slide3))
    (fill_image (atoi coordx) (atoi coordy) (atoi ancho) (atoi alto) 105)
    (slide_image (atoi coordx) (atoi coordy) (atoi ancho) (atoi alto) (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
    (setq contop (1+ contop))
  )
)

(defun dibujaop3 (listactn listactn2 NOPCGR slide1D slide2D slide3D)
    (setq coord (substr listactn (1+ (* (1- NOPCGR) 8)) 8))
    (setq stdibuj (substr listactn2 NOPCGR 1))
    (setq coordx (substr coord 1 4))
    (setq coordy (substr coord 5 4))
    (if (= stdibuj "0") (setq slidexx slide1D))
    (if (= stdibuj "1") (setq slidexx slide2D))
    (if (= stdibuj "2") (setq slidexx slide3D))
    (slide_image (atoi coordx) (atoi coordy) ancho alto (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
)

(defun dibujaptn ()
  (setq nelemind (/ (strlen LISTADCLOBJ) 74))
  (setq neleopc (/ (strlen LISTADCLOBJ2) 274))
  (setq contdib 1)
  (repeat neleopc
    (setq elemdb (substr LISTADCLOBJ2 (1+ (* (1- contdib) 274)) 274))
    (dibujaelem elemdb)
    (setq contdib (1+ contdib))
  )
  (setq contdib 1)
  (repeat nelemind
    (setq elemdb (substr LISTADCLOBJ (1+ (* (1- contdib) 74)) 74))
    (dibujaelem elemdb)
    (setq contdib (1+ contdib))
  )
)