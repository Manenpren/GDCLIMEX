(DEFUN subtraebd (fechaini fechafin); fecha con solo años 4 caracteres
  (slide_image 3 270 173 252 (STRCAT RUTA "SLIDES\\INDICE.SLD"))
  (setq nciclos (1+ (/ (- (atoi fechafin) (atoi fechaini)) 20)))
  (setq contci 1)
  (setq freti fechaini)
  (repeat nciclos
    (if (= contci 1)
      (progn
        (fill_image 14 (+ 291 (* 18 (1- contci))) 62 16 20)
        (stexto (strcat freti "-" (itoa (+ 19 (atoi freti)))) "romans" 12 14 (+ 292 (* 18 (1- contci))))
      )
      (stexto (strcat freti "-" (itoa (+ 19 (atoi freti)))) "romans" 12 14 (+ 292 (* 18 (1- contci))))
    )
    (setq freti (itoa (+ 20 (atoi freti))))
    (setq contci (1+ contci))
  )
  (dibujaindiceb fechaini fechafin)
)
