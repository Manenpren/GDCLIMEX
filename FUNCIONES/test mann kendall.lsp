(defun tmankendall (estacion procedencia variable FECHAINI FECHAFIN tipodat tipoproceso)
  (C:LIBRERIA "lee datos estacion")
  (C:LIBRERIA "mediana")
;  (setq fechaini "190001")
  (if (AND (OR (= variable 1) (= variable 3)) (OR (= tipoproceso "MA") (= tipoproceso "MI") (= tipoproceso "ME")))
    (SETQ CARY 6)
  )
  (if (AND (OR (= variable 7) (= variable 8) (= variable 9)) (OR (= tipoproceso "MA") (= tipoproceso "MI") (= tipoproceso "ME")) )
    (SETQ CARY 5)
  )
  (if (= tipoproceso "TO")
    (SETQ CARY 9)
  )
  (if (= tipoproceso "VC")
    (SETQ CARY 5)
  )
  (if (and (or (= variable 2) (= variable 4) (= variable 5) (= variable 6)) (/= tipoproceso "VC"))
    (SETQ CARY 1)
  )
  (if (= tipodat "ST") (setq carx 6))
  (if (/= tipodat "ST") (setq carx 4))
  (setq caracterprov "")
  (repeat CARY
    (setq caracterprov (strcat caracterprov "x"))
  )
  (setq datoex (leebd estacion procedencia variable fechaini tipodat tipoproceso))
  (setq listacon (smeses datoex))
  (setq zkendall zkendall)
  (setq contx 1)
  (setq zkendallf nil)
  (repeat 12
    (SETQ SF (signifi (CDR (ASSOC contx LISTACON)) carx cary))
    (setq vars (varianzas (CDR (ASSOC contx LISTACON))))
    (if (> sf 0) (setq zkendall (/ (1- sf) (sqrt vars))))
    (if (= sf 0) (setq zkendall 0))
    (if (< sf 0) (setq zkendall (/ (1+ sf) (sqrt vars))))
    (setq valorq (mediana hqkendall 4 12))
    (setq valorbf (calcb (CDR (ASSOC contx LISTACON))))
    (setq ecuacion (list valorq valorbf zkendall))
    (setq CONCATENADO (cons contx ecuacion)) 
    (setq zkendallf (append zkendallf (list CONCATENADO)))
    (setq contx (1+ contx))
  )
  (setq zkendallf zkendallf)
)

(defun calcb (datoexs)
  (setq nmeses (/ (strlen datoexs) (+ 4 cary)))
  (setq contb 1)
  (setq hbkendall "")
  (setq datomenx (substr datoexs (+ 1 (* (1- contb) (+ 4 cary))) 4))
  (repeat nmeses
    (setq datomen (substr datoexs (+ 5 (* (1- contb) (+ 4 cary))) cary))
    (setq datomen2 (substr datoexs (+ 1 (* (1- contb) (+ 4 cary))) 4))
    (setq hbkendall (strcat hbkendall (ntocad contb 0 3) (ntocad (- (atof datomen) (* (atof valorq) (- (atoi datomen2) (atoi datomenx)))) 6 12)))
    (setq contb (1+ contb))
  )
  (setq valorb (mediana hbkendall 3 12))
)

(defun varianzas (datoexs)
  (setq nmeses (/ (strlen datoexs) (+ 4 cary)))
  (setq varpart1 (/ 1.00 18.00))
  (setq varpart2 (* nmeses (1- nmeses) (+ (* 2 nmeses) 5)))
  (setq contvrz 1)
  (setq varpart3 0)
  (repeat gkendall
    (setq vtp1 (atoi (substr htpkendall (1+ (* (1- contvrz) 3)) 3)))
    (setq varpart3 (+ varpart3 (* vtp1 (1- vtp1) (+ (* 2 vtp1) 5))))
    (setq contvrz (1+ contvrz)) 
  )
  (setq vars (* varpart1 (- varpart2 varpart3)))
)

(defun signifi (datoexs carx cary)
  (setq nmeses (/ (strlen datoexs) (+ 4 cary)))
  (SETQ S 0)
  (SETQ K 1)
  (setq htpkendall "")
  (setq hqkendall "")
  (setq hqkendall2 "")
  (setq contadqbf 1)
  (setq gkendall 0)
  (repeat (1- nmeses)
    (setq datomen (substr datoexs (+ 5 (* (1- K) (+ 4 cary))) cary))
    (SETQ J (1+ K))
    (setq tpkendall 0)
    (setq bandera 0)
    (repeat (- nmeses k)
      (setq datomen2 (substr datoexs (+ 5 (* (1- J) (+ 4 cary))) cary))
      (if (= datomen datomen2)
        (progn
          (setq bandera2 0)
          (if (> k 1)
            (progn
              (setq cont3 1)
              (while (and (< cont3 k) (= bandera2 0))
                (setq datomen3 (substr datoexs (+ 5 (* (1- cont3) (+ 4 cary))) cary))
                (if (= datomen3 datomen2)
                  (setq bandera2 1)
                )
                (setq cont3 (1+ cont3))
              )
            )
          )
          (if (= bandera2 0)
            (if (= bandera 0)
              (progn
                (setq bandera 1)
                (setq gkendall (1+ gkendall))
                (setq tpkendall (1+ tpkendall))
              )
              (progn
                (setq bandera 1)
                (setq tpkendall (1+ tpkendall))
              )
            )
          )
        )
      )
      (IF (AND (/= DATOMEN CARACTERPROV) (/= DATOMEN2 CARACTERPROV))
        (PROGN
          (SETQ RESTA (* 1.000 (- (ATOF DATOMEN2) (ATOF DATOMEN))))
          (IF (> RESTA 0) (SETQ SR 1))
          (IF (< RESTA 0) (SETQ SR -1))
          (IF (= RESTA 0) (SETQ SR 0))
          (setq hqkendall (strcat hqkendall (ntocad contadqbf 0 4) (ntocad (/ RESTA (- j k)) 6 12))) ;
          (setq hqkendall2 (strcat hqkendall2 ",xxxx" (ntocad (/ RESTA (- j k)) 6 12))) ;
          (setq contadqbf (1+ contadqbf))
        )
        (SETQ SR 0)
      )
      (SETQ S (+ S SR))
      (SETQ J (1+ J))
    )
    (if (> tpkendall 0) (setq htpkendall (strcat htpkendall (ntocad (1+ tpkendall) 0 3))))
    (SETQ K (1+ K))
  )
  (setq s s)   
)

(defun smeses (datoexs)
  (setq nmeses (/ (strlen datoexs) (+ carx cary)))
  (setq datene "")
  (setq datfeb "")
  (setq datmar "")
  (setq databr "")
  (setq datmay "")
  (setq datjun "")
  (setq datjul "")
  (setq datago "")
  (setq datsep "")
  (setq datoct "")
  (setq datnov "")
  (setq datdic "")
  (setq contt 1)
  (repeat nmeses
    (setq datomen (substr datoexs (1+ (* (1- contt) (+ carx cary))) (+ carx cary)))
    (if (/= (substr datomen (1+ carx) 1) "x")
      (progn
        (setq coordmes (/ (atoi (substr datomen 1 carx)) 12.00))
        (setq coordmesfan (fix (/ (atoi (substr datomen 1 carx)) 12)))
        (setq difer (rtos (- coordmes coordmesfan) 2 3))
        (if (= difer "0.083") (setq datene (strcat datene (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.167") (setq datfeb (strcat datFEB (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary)))) 
        (if (or (= difer "0.250") (= difer "0.25")) (setq datmar (strcat datMAR (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.333") (setq databr (strcat datABR (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.417") (setq datmay (strcat datMAY (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (or (= difer "0.500") (= difer "0.5")) (setq datjun (strcat datJUN (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.583") (setq datjul (strcat datJUL (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.667") (setq datago (strcat datAGO (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (or (= difer "0.750") (= difer "0.75")) (setq datsep (strcat datSEP (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.833") (setq datoct (strcat datOCT (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (= difer "0.917") (setq datnov (strcat datNOV (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
        (if (or (= difer "0.000") (= difer "0")) (setq datdic (strcat datDIC (itoa (+ 1900 coordmesfan)) (substr datomen (1+ carx) cary))))
      )
    )
    (setq contt (1+ contt))
  )
  (setq resultado nil)
   (setq CONCATENADO (cons 1 datene)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 2 datfeb)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 3 datmar)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 4 databr)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 5 datmay)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 6 datjun)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 7 datjul)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 8 datago)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 9 datsep)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 10 datoct)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 11 datnov)) 
   (setq resultado (append resultado (list CONCATENADO)))
   (setq CONCATENADO (cons 12 datdic)) 
   (setq resultado (append resultado (list CONCATENADO)))
)

;(tmankendall "16087" "C" 3 "ME" "ME")
;estacion	cadena		estacion a graficar
;procedencia	cadena		Clicom o erick
;variable	entero		variable climatica a graficar 1-9
;FECHAINI	CADENA		FECHA INICIAL A PROCESAR LOS DATOS DE LA GRAFICA formato de 4 6 o 8 caracteres segun se requiera
;FECHAFIN	CADENA		FECHA INICIAL A PROCESAR LOS DATOS DE LA GRAFICA formato de 4 6 o 8 caracteres segun se requiera
;tipodat	CADENA		tipo de datos a graficar "AN" "ME" "ST" "MM"
;tipoproceso	cadena		tipo de proceso a recibir la cadena (valores maximos, minimos, medios, totales, %vacios, serie temporal) "MA" "MI" "ME" "TO" "VC" "ST"