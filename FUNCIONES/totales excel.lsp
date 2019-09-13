(DEFUN totalese (cadenapr periodo datoclim)
  (if (= datoclim 1) (progn (setq ndec 2) (setq anchochr 6)))
  (if (= datoclim 2) (progn (setq ndec 0) (setq anchochr 1)))
  (if (= datoclim 3) (progn (setq ndec 2) (setq anchochr 6)))
  (if (= datoclim 4) (progn (setq ndec 0) (setq anchochr 1)))
  (if (= datoclim 5) (progn (setq ndec 0) (setq anchochr 1)))
  (if (= datoclim 6) (progn (setq ndec 0) (setq anchochr 1)))
  (if (= datoclim 7) (progn (setq ndec 2) (setq anchochr 5)))
  (if (= datoclim 8) (progn (setq ndec 2) (setq anchochr 5)))
  (if (= datoclim 9) (progn (setq ndec 2) (setq anchochr 5)))
  (setq anchol (+ 11 (* 31 anchochr)))
  (setq nmeses (/ (strlen cadenapr) anchol))
  (setq caracterprov "")
  (repeat anchochr
    (setq caracterprov (strcat caracterprov "x"))
  )
  (setq fret fechaini)
  (if (= periodo "ME")
   (progn
     (setq contmeses 1)
     (setq contci 1)
     (setq maxmes nil) 
     (repeat nmeses
       (setq ldat (substr cadenapr (1+ (* anchol (1- contci))) anchol))
       (setq dmax (acumuladom ldat))
       (if (/= dmax caracterprov)
         (progn
           (setq lineaf (list  (cons 'A�o (substr ldat 1 4)) (cons 'Mes (substr ldat 5 2)) (cons 'dato dmax)))
           (setq maxmes (append maxmes (list lineaf)))
         )
         (setq lineaf "")
       )
       (setq contci (1+ contci))
     )
   )
  )
  (if (= periodo "MM")
   (progn
     (setq contci 1)
     (setq Varm1 0)
     (setq Varm2 0)
     (setq Varm3 0)
     (setq Varm4 0)
     (setq Varm5 0)
     (setq Varm6 0)
     (setq Varm7 0)
     (setq Varm8 0)
     (setq Varm9 0)
     (setq Varm10 0)
     (setq Varm11 0)
     (setq Varm12 0)
     (repeat nmeses
       (setq ldat (substr cadenapr (1+ (* anchol (1- contci))) anchol))
       (setq dmax (acumuladom ldat))
       (setq mes (substr ldat 5 2))
       (if (and (= mes "01") (/= dmax caracterprov)) (progn (setq varm1 (+ (atof dmax) varm1))))
       (if (and (= mes "02") (/= dmax caracterprov)) (progn (setq varm2 (+ (atof dmax) varm2))))
       (if (and (= mes "03") (/= dmax caracterprov)) (progn (setq varm3 (+ (atof dmax) varm3))))
       (if (and (= mes "04") (/= dmax caracterprov)) (progn (setq varm4 (+ (atof dmax) varm4))))
       (if (and (= mes "05") (/= dmax caracterprov)) (progn (setq varm5 (+ (atof dmax) varm5))))
       (if (and (= mes "06") (/= dmax caracterprov)) (progn (setq varm6 (+ (atof dmax) varm6))))
       (if (and (= mes "07") (/= dmax caracterprov)) (progn (setq varm7 (+ (atof dmax) varm7))))
       (if (and (= mes "08") (/= dmax caracterprov)) (progn (setq varm8 (+ (atof dmax) varm8))))
       (if (and (= mes "09") (/= dmax caracterprov)) (progn (setq varm9 (+ (atof dmax) varm9))))
       (if (and (= mes "10") (/= dmax caracterprov)) (progn (setq varm10 (+ (atof dmax) varm10))))
       (if (and (= mes "11") (/= dmax caracterprov)) (progn (setq varm11 (+ (atof dmax) varm11))))
       (if (and (= mes "12") (/= dmax caracterprov)) (progn (setq varm12 (+ (atof dmax) varm12))))
       (setq contci (1+ contci))
     )
     (if (= varm1 0)
       (setq varm1 caracterprov)
       (setq varm1 (ntocad varm1 ndec (+ 3 anchochr)))
     )
     (if (= varm2 0)
       (setq varm2 caracterprov)
       (setq varm2 (ntocad varm2 ndec (+ 3 anchochr)))
     )
     (if (= varm3 0)
       (setq varm3 caracterprov)
       (setq varm3 (ntocad varm3 ndec (+ 3 anchochr)))
     )
     (if (= varm4 0)
       (setq varm4 caracterprov)
       (setq varm4 (ntocad varm4 ndec (+ 3 anchochr)))
     )
     (if (= varm5 0)
       (setq varm5 caracterprov)
       (setq varm5 (ntocad varm5 ndec (+ 3 anchochr)))
     )
     (if (= varm6 0)
       (setq varm6 caracterprov)
       (setq varm6 (ntocad varm6 ndec (+ 3 anchochr)))
     )
     (if (= varm7 0)
       (setq varm7 caracterprov)
       (setq varm7 (ntocad varm7 ndec (+ 3 anchochr)))
     )
     (if (= varm8 0)
       (setq varm8 caracterprov)
       (setq varm8 (ntocad varm8 ndec (+ 3 anchochr)))
     )
     (if (= varm9 0)
       (setq varm9 caracterprov)
       (setq varm9 (ntocad varm9 ndec (+ 3 anchochr)))
     )
     (if (= varm10 0)
       (setq varm10 caracterprov)
       (setq varm10 (ntocad varm10 ndec (+ 3 anchochr)))
     )
     (if (= varm11 0)
       (setq varm11 caracterprov)
       (setq varm11 (ntocad varm11 ndec (+ 3 anchochr)))
     )
     (if (= varm12 0)
       (setq varm12 caracterprov)
       (setq varm12 (ntocad varm12 ndec (+ 3 anchochr)))
     )
     (setq maxmes (strcat "0001" varm1 "0002" varm2 "0003" varm3 "0004" varm4 "0005" varm5 "0006" varm6 "0007" varm7 "0008" varm8 "0009" varm9 "0010" varm10 "0011" varm11 "0012" varm12)) 
     (setq maxmes2 nil)
     (setq contci 1)
     (repeat 12
       (setq ldat (substr maxmes (1+ (* (+ 4 anchochr) (1- contci))) (+ 4 anchochr)))
       (setq lineaf (list (cons 'mes contci) (cons 'dato (substr ldat 5 anchochr))))
       (setq maxmes2 (append maxmes2 (list lineaf)))
       (setq contci (1+ contci))
     )
     (setq maxmes maxmes2)
   )
  )
  (if (= periodo "AN")
   (progn
     (setq contmeses 1)
     (setq contci 1)
     (setq maxmes 0)
     (setq maxamo nil)
     (setq contmesx 0) 
     (repeat nmeses
       (setq ldat (substr cadenapr (1+ (* anchol (1- contci))) anchol))
       (IF (= CONTCI 1) (SETQ FRET (substr ldat 1 4)))
       (setq dmax (acumuladom ldat))
       (if (/= fret (substr ldat 1 4))
         (progn
           (if (= contmesx 12)
             (progn
               (setq lineaf (list  (cons 'A�o (substr fret 1 4)) (cons 'dato maxmes)))
               (setq maxamo (append maxamo (list lineaf)))
             )
           )
           (setq contmesx 0)
	   (setq fret (ANMAS FRET)) 
           (setq contmeses (1+ contmeses))
           (WHILE (/= FRET (substr ldat 1 4))
             (setq fret (ANMAS FRET)) 
             (setq contmeses (1+ contmeses))
           )
           (setq maxmes 0)
         )
       )
       (if (/= dmax caracterprov)
         (progn
           (setq maxmes (+ maxmes (atof dmax)))
           (setq contmesx (1+ contmesx))
           (setq ultimodat "s")
         )
         (setq ultimodat "n")
       )
       (setq contci (1+ contci))
     )
     (if (= contmesx 12)
       (progn
         (setq lineaf (list  (cons 'A�o (substr fret 1 4)) (cons 'dato maxmes)))
         (setq maxmes (append maxamo (list lineaf)))
       )
       (setq maxmes maxamo)
     )
   )
  )
  (setq maxmes maxmes)
)

(defun acumuladom (cadenaf)
  (setq contmx 1)
  (setq vmedio 0)
  (setq ndias (numerodias (substr cadenaf 1 6)))
  (setq datonulo "")
  (repeat ndias
    (setq chrprov (substr cadenaf (+ 7 (* anchochr (1- contmx))) anchochr))
    (if (/= chrprov caracterprov)
      (progn
        (setq vmedio (+ (atof chrprov) vmedio))
      )
      (setq datonulo "s")
    )
    (setq contmx (1+ contmx))
  )
  (if (= datonulo "s")
    (setq vmedio caracterprov)
    (setq vmedio (ntocad vmedio ndec (+ 3 anchochr)))
  )
)

(defun mesmas (fecha)
  (setq mes (substr fecha 5 2))
  (if (= mes "12")
    (progn
      (setq amo (1+ (atoi (substr fecha 1 4))))
      (setq fechaf (strcat (itoa amo) "01"))
    )
    (progn
      (setq fechaf (strcat (substr fecha 1 4) (NTOCAD (1+ (atoi (substr fecha 5 2))) 0 2)))
    )
  )
  (setq fechaf fechaf)
)

(defun anmas (fecha)
  (setq fechaf (itoa (1+ (atoi fecha))))
)

;periodo	cadena		anual, media mensual o mensual "AN" "MM" "ME"
;cadenapr	cadena		cadena fuente a procesar
;datoclim	entero		numero de dato climatologico a procesar
;fechaini	cadena		fecha de comienzo de los datos "198101"

;  (setq ArcCon (open "d:\\x.cli" "r"))
;  (setq lINEAfUENTE (read-line arcCon))
;  (close arcCon)
;  (setq prov (media lineafuente "AN" 1 "198712"))
;  (acumuladom "198712xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx004.00006.00005.00004.00003.00002.00002.00006.00002.00005.00007.00003.00002.00003.00006.00006.00002.0054.84")
