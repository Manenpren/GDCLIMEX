(DEFUN SUMA (P VX VY)
  (SETQ X (CAR P))
  (SETQ Y (CAR (CDR P)))
  (LIST (+ X VX) (+ Y VY) (LAST P))
)

(DEFUN COLUMNAS ()
  (SETQ CA (SUBSTR LIN 1 1))
  (SETQ C 0) (SETQ X 1)
  (WHILE (/= CA "")
    (SETQ C (+ C 1))
    (SETQ DATO "")
    (WHILE (AND (/= CA ",") (/= CA ""))
      (SETQ X (+ X 1))
      (SETQ DATO (STRCAT DATO CA))
      (SETQ CA (SUBSTR LIN X 1))
    )
    (SETQ DATO (CONS (STRCAT (ITOA L) "-" (ITOA C)) DATO))
    (SETQ DATOSlp (APPEND DATOSlp (LIST DATO)))
    (SETQ CA (SUBSTR LIN (+ X 1) 1))
    (SETQ X (+ X 1))
  )
)

(DEFUN ANALIZA ()
  (SETQ NC 0) (SETQ LONTOT 0)
  (SETQ LONCOLS (LIST))
  (WHILE (/= NC C)
    (SETQ NC (+ NC 1))
    (SETQ NL 0) (SETQ LONG 0)
    (WHILE (/= NL L)
      (SETQ NL (+ NL 1))
      (SETQ CLAVE (STRCAT (ITOA NL) "-" (ITOA NC)))
      (IF (> (STRLEN (CDR (ASSOC CLAVE DATOSlp))) LONG)
        (SETQ LONG (STRLEN (CDR (ASSOC CLAVE DATOSlp))))
      )
    )
    (PRINC "\n")
;    (SETQ M1 (STRCAT " LONGITUD MINIMA COLUMNA No. " (ITOA NC)))
;    (SETQ M2 (STRCAT M1 "  " (ITOA (+ LONG 1)) " CARACTERES "))
;    (PRINC M2)
;    (SETQ LONCOL (GETINT "\n LONGITUD DE COLUMNA:  "))
    (SETQ LONCOLS (APPEND LONCOLS (LIST (+ long 1))))
    (SETQ LONTOT (+ LONTOT (+ long 1)))
  )
  (SETQ TAM 1)
)

(DEFUN LEELP ()
  (SETQ LIN (READ-LINE TBL))
  (SETQ L 1)
  (SETQ DATOSlp (LIST))
  (WHILE LIN 
    (COLUMNAS)
    (SETQ L (+ L 1))
    (SETQ LIN (READ-LINE TBL))
  )
  (SETQ L (- L 1))
  (ANALIZA)
  (CLOSE TBL)
)

(DEFUN LINEAS ()
  (SETQ LONGITUD (* LONTOT TAM))
  (SETQ EII (GETPOINT "\n ESQUINA INFERIOR IZQ. DE TABLA "))
;  (SETVAR "CECOLOR" "1")
  (COMMAND "LINE" EII (POLAR EII 0 LONGITUD) "")
  (COMMAND "ARRAY" "LAST" "" "R" (+ L 1) 1 (* TAM 2))
;  (SETVAR "CECOLOR" "BYLAYER")
  (COMMAND "LINE" EII (POLAR EII 1.5708 (* TAM 2 L)) "")
  (SETQ NC2 -1) (SETQ DIST 0)
  (COMMAND "ZOOM" "W" (SUMA EII TAM TAM) (SUMA EII (- TAM TAM TAM) (- TAM TAM TAM)))
  (WHILE (/= NC2 (- C 1))
    (SETQ NC2 (+ NC2 1))
    (SETQ DIST (+ DIST (* (NTH NC2 LONCOLS) TAM)))
    (COMMAND "OFFSET" DIST (POLAR EII 1.5708 TAM) (POLAR EII 0 TAM) "")
  )
  (COMMAND "ZOOM" "P")
)

(DEFUN COLOCA ()
  (SETQ NL 0)
  (WHILE (/= NL L)
    (SETQ NL (+ NL 1))
    (SETQ NC 0) (SETQ COLUMNA 0)
    (WHILE (/= NC C)
      (SETQ NC (+ NC 1))
      (SETQ CLAVE (STRCAT (ITOA NL) "-" (ITOA NC)))
      (SETQ EI (SUMA EII COLUMNA (* TAM (- L NL) 2)))
      (SETQ PBI (POLAR EI 0.785398 (/ TAM 1.2)))
      (IF (OR (= (ATOF (CDR (ASSOC CLAVE DATOSlp))) 0) (= NC 50))
        (COMMAND "INSERT" (strcat ruta "blocks\\TEXTO") PBI "" "" "")
        (COMMAND "INSERT" "NUMERO"
           (SUMA PBI (- (* (NTH (- NC 1) LONCOLS) TAM) 1) 0)
           "" "" ""
        )
      )
      (SETQ TM (* TAM 25))
      (SETQ BLOQUE (ENTLAST))
      (COMMAND "EXPLODE" BLOQUE)
      (SETQ E (ENTLAST))
      (ENTMOD (SUBST (CONS 1 (CDR (ASSOC CLAVE DATOSlp)))
                     (ASSOC 1 (ENTGET E))
                     (ENTGET E)
              )
      )
      (SETQ COLUMNA (+ COLUMNA (NTH (- NC 1) LONCOLS)))
    )
  )
)

(DEFUN SECUENCIA ()
  (LEELP)
  (LINEAS)
  (COLOCA)
)

(defun formato (datang)
  (write-line datang)
  (if (/= 1 (strlen datang))
    (progn
      (setq cuca 1)
      (while (/= cuca (strlen datang))
        (setq cara (substr datang cuca 1))
        (if (= "d" cara)
          (progn
            (setq t1 (substr datang 1 (- cuca 1)))
            (setq t2 (substr datang (+ cuca 1)))
            (setq datang2 (strcat t1 "%%d" t2))
          )
        )
        (setq cuca (+ cuca 1))
      )
    )
    (setq datang2 datang)
  )
  (setq datang datang2)
)


(defun cierra ()
  (setq puntoa p)
  (setq xa (car puntoa))
  (setq ya (car (cdr puntoa)))
  (setq d (rtos (distance punto puntoa) 2 3))
  (setq a (angtos (angle punto puntoa)))
  (setq aa (formato a))
  (setq est numpun)
  (setq pv numpun1)
  (setq renglon (strcat est "," pv "," d "," aa "," (rtos xa 2 3) "," (rtos ya 2 3)))
  (write-line renglon arch)
  (command "INSERT" "COTA" (polar puntoa (angle puntoa punto) (/ (atof d) 2)) esc "" a d)
)

(defun datosg ()
  (setq punto (list x1 y1))
  (setq puntoa (list xa ya))
  (setq d (rtos (distance punto puntoa) 2 3))
  (setq a (angtos (angle puntoa punto)))
  (setq aa (formato a))
  (setq est numpuna)
  (setq pv numpun)
  (setq renglon (strcat est "," pv "," d "," aa "," (rtos x1 2 3) "," (rtos y1 2 3)))
  (write-line renglon arch)
  (command "INSERT" "COTA" (polar punto (angle punto puntoa) (/ (atof d) 2)) esc "" a d)
)

(defun c:are2 ()
  (command "osnap" "none")
  (command "UNITS" "2" "3" "5" "4" "E" "N")
  (command "layer" "M" "automatico" "")
  (command "layer" "M" "cotas" "")
;  (command "ZOOM" "E")
  (setq arranque 1000)
  (setq inicio (getint "\n inicio: "))
  (setq man (getint "\n manzana: "))
  (setq esc (getreal "\n Escala del texto: "))
  (setq letra "a")
  (repeat 1000
    (setq PUNTO (getpoint " DAME EL CENTRO DEL AREA : "))
    (setq arch (open "lintop" "w"))
    (COMMAND "BPOLY" PUNTO "")
    (setq LIN (entlast))
    (command "AREA" "OB" LIN "")
    (SETQ AREA (RTOS (GETVAR "AREA") 2 3))
    (COMMAND "INSERT" "NOMAR" PUNTO esc "" "" (strcat "M" (itoa Man) "-" (itoa inicio) letra) AREA)
  (setq arch (open "lintop" "w"))
  (setq renglon "EST.,P.V.,DISTANCIA, RUMBO,   X,   Y")
  (write-line renglon arch)
  (setq nop 1)
  (setq lista (entget lin))
  (setq xa nil)
  (while lista
    (setq elemento (car lista))
    (if (= 10 (car elemento))
      (progn 
        (setq p1 (cdr elemento))
        (setq gnupo (ssget "C" (suma p1 0.01 0.01) (suma p1 -0.01 -0.01)))
        (setq conta 0)
        (setq enco 0)
        (while (/= conta (sslength gnupo))
          (setq nnupo (ssname gnupo conta))
          (SETQ PV (cdr (assoc 10 (entget nnupo))))
          (SETQ XV (CAR PV))
          (SETQ YV (CADR PV))
          (SETQ X1 (CAR P1))
          (SETQ Y1 (CADR P1))
          (if (= "PUNTO" (cdr (assoc 2 (entget nnupo))))
            (IF (AND (= (RTOS XV 2 2) (RTOS X1 2 2)) (= (RTOS YV 2 2) (RTOS Y1 2 2)))
              (progn
                (setq enco 1)
                (setq conta (- (sslength gnupo) 1))
              )
            )
          )
          (setq conta (+ conta 1))
        )
        (if (= enco 1)
          (progn
            (setq atr1 (entnext nnupo))
;            (setq atr2 (entnext atr1))
;            (setq atr3 (entnext atr2))
            (setq numpun (cdr (assoc 1 (entget atr1))))
            (setq espu (cdr (assoc 41 (entget nnupo))))
          )
          (progn
            (write-line " Vertice sin asignacion de punto; procediendo con asigmacion automatica: ")
;            (command "INSERT" "PUNTO" p1 espu "" "" (rtos (+ arranque 1) 2 0)  "AUTOMATICO" "" "")
            (command "CHANGE" (entlast) "" "P" "LA" "AUTOMATICO" "")
            (setq arranque (+ arranque 1))
            (setq numpun (rtos arranque 2 0))
          )
        )
        (setq x1 (car p1))
        (setq y1 (car (cdr p1)))
        (if xa
          (progn
            (setq nop (+ nop 1))
            (datosg)
          )
          (progn
            (setq p p1)
            (setq x x1)
            (setq y y1)
            (setq numpun1 numpun)
          )
        )
        (setq xa x1)
        (setq ya y1)
        (setq numpuna numpun)
      )
    )
    (setq lista (cdr lista))
  )
  (cierra)
  (close arch)
  (command "erase" lin "")
  (If (= letra "b")
    (progn
     (setq inicio (1+ inicio))
     (setq letra "a")
    )
    (setq letra "b")
  )
  )
)

