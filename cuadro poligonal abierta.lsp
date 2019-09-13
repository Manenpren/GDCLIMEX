(defun c:ccpol ()
  (command "undo" "m")
  (COMMAND "VIEW" "S" "PROV")
  (SETQ OPCIONESOS (GETVAR "OSMODE"))
  (COMMAND "DIMZIN" 1)
  (command "osnap" "none")
  (COMMAND "LUNITS" 2)
  (COMMAND "LUPREC" 3)
  (COMMAND "AUNITS" 4)
  (COMMAND "AUPREC" 4)
  (COMMAND "ANGDIR" 0)
  (COMMAND "ANGBASE" 0.0)
  (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
  (C:LIBRERIA "vertices de una lwpolyline to var")
  (C:LIBRERIA "revisa polilynea ceros,bloques  y zoom")
  (C:LIBRERIA "encuentra block mas cercano a punto")
  (C:LIBRERIA "TRAMOS POLYLINEA")
  (setq lin (car (entsel "\n Selecciona la polylinea a procesar: ")))
  (COMMAND "AREA" "E" LIN)
  (while (/= "LWPOLYLINE" (cdr (assoc 0 (entget lin))))
      (if (/= "LWPOLYLINE" (cdr (assoc 0 (entget lin))))
        (progn   
          (alert "\nEl objeto debe ser polylinea ")
          (setq lin (car (entsel "\n Selecciona objeto: ")))
        )
      )
  )
 (mpun lin)
 (setq mvertices (trpol lin))
 (COMMAND "AREA" "E" LIN)
 (SETQ matrizcuadro NIL)
 (setq ltram (cdr (assoc 0 mvertices)))
 (setq ttram (car ltram))
 (SETQ DACUM 0)
 (if (= ttram "L")
    (progn
       (setq verpol1 (cdr (assoc 0 vertices)))
       (setq block1 (blocktopto verpol1 0.01))
       (setq xpol1 (rtos (car verpol1) 2 3))
       (setq ypol1 (rtos (car (cdr verpol1)) 2 3))
       (setq codigo1 (BUSATR block1 "PUNTO"))
       (setq dacum2 (cadddr ltram))
       (SETQ DACUM (+ DACUM DACUM2))
       (setq renglon (list (cons 0 codigo1) (cons 1 (rtos dacum 2 3)) (cons 2 (rtos dacum2 2 3)) (cons 3 "") (cons 4 "") (cons 5 "") (cons 6 0) (cons 7 0) (cons 8 0) (cons 9 0) (cons 10 xpol1) (cons 10 ypol1)))
       (setq CONCATENADO (cons 1 renglon))
       (setq matrizcuadro (append matrizcuadro (list CONCATENADO)))
    )
 )
 (if (= ttram "C")
    (progn
       (setq verpol1 (cdr (assoc 0 vertices)))
       (setq block1 (blocktopto verpol1 0.01))
       (setq xpol1 (rtos (car verpol1) 2 3))
       (setq ypol1 (rtos (car (cdr verpol1)) 2 3))
       (setq codigo1 (BUSATR block1 "PUNTO"))
       (setq dacum2 (cadddr ltram))
       (SETQ DACUM (+ DACUM DACUM2))
       (setq renglon (list (cons 0 codigo1) (cons 1 (rtos dacum 2 3)) (cons 2 (rtos dacum2 2 3)) (cons 3 "") (cons 4 "") (cons 5 "") (cons 6 0) (cons 7 0) (cons 8 0) (cons 9 0) (cons 10 xpol1) (cons 10 ypol1)))
       (setq CONCATENADO (cons 1 renglon))
       (setq matrizcuadro (append matrizcuadro (list CONCATENADO)))
       (setq verpol2 (cadr ltram))                                     ; pi
       (setq vercen (caddr ltram))
       (setq angi (rtos (car verpol2) 2 3))
       (setq angf (rtos (cadr verpol2) 2 3))
       (setq radio (rtos (caddr verpol2) 2 3))
       (setq g (/ 1145.92 radio))
       (setq delta (/ (* dacum2 g) 20))
       (setq cl (* 2 radio (sin (/ delta 2))))
       (setq thetac (/ (* g dacum2) 40))
       (setq st (/ (/ cl 2) (sin thetac)))
       (setq dx (sqrt (- (expt st 2) (expt (/ cl 2) 2))))
       (setq m (- radio (* radio (cos (/ delta 2)))))
       (setq e (- dx m))

       (setq block2 (blocktopto verpol1 0.01))
       (setq xpol1 (rtos (car verpol1) 2 3))
       (setq ypol1 (rtos (car (cdr verpol1)) 2 3))
       (setq codigo1 (BUSATR block1 "PUNTO"))

       (setq codigo1 (BUSATR block1 "PUNTO"))

       (setq block1 (blocktopto verpol1 0.01))

        (SETQ RADIO (cdr (assoc 40 (entget e))))
        (SETQ RADIOx (cdr (assoc 10 (entget e))))
        (SETQ Yr (CADR radiox))
        (SETQ Xr (CAR radiox))
        (SETQ ANGINI (cdr (assoc 50 (entget e))))
        (SETQ ANGF (cdr (assoc 51 (entget e))))
        (setq xc1 (+ xr (* radio (cos angini))))
        (setq yc1 (+ yr (* radio (sin angini))))
        (setq xc2 (+ xr (* radio (cos angf))))
        (setq yc2 (+ yr (* radio (sin angf))))
        (setq xyz (list xc1 yc1))
        (setq xyz2 (list xc2 yc2))
        (IF (< ANGINI ANGF)
          (PROGN
            (SETQ DIF (- ANGF ANGINI))
            (setq ang2 (+ angini (/ dif 2)))
          )
          (PROGN
            (SETQ ANGF (+ ANGF 6.28318))
            (SETQ DIF (- ANGF ANGINI))
            (setq ang2 (+ angini (/ dif 2)))
          )
        )
        (setq xc3 (+ xr (* radio (cos ang2))))
        (setq yc3 (+ yr (* radio (sin ang2))))
        (SETQ DISTANCIA (* RADIO DIF))
      )
      (progn
        (SETQ xyz (cdr (assoc 10 (entget e))))
        (SETQ xyz2 (cdr (assoc 11 (entget e))))
        (setq distancia (distance xyz xyz2))
      )


       (setq renglon (list (cons 0 codigo1) (cons 1 (rtos dacum 2 3)) (cons 2 (rtos dacum2 2 3)) (cons 3 "") (cons 4 "") (cons 5 "") (cons 6 0) (cons 7 0) (cons 8 0) (cons 9 0) (cons 10 xpol1) (cons 10 ypol1)))
       (setq CONCATENADO (cons 1 renglon))
       (setq matrizcuadro (append matrizcuadro (list CONCATENADO)))
    )
 )
 (setq cuever 2)
 (setq verpol 1)
 (setq blocki block1)
 (setq xpoli xpol1)
 (setq ypoli ypol1)
 (setq codigoi codigo1)
 (setq verpoli verpol1)
 (while verpol
   (setq verpol (cdr (assoc cuever mvertices)))
   (IF (/= VERPOL NIL)
    (PROGN
     (setq block (blocktopto verpol 0.01))
     (setq xpol (rtos (car verpol) 2 3))
     (setq ypol (rtos (car (cdr verpol)) 2 3))
     (setq codigo (BUSATR block "PUNTO"))
     (if (= codigo nil) (alert "block sin atributo de codigo"))
     (setq a (angtos (angle verpol1 verpol)))
     (setq aa (formato a))
     (setq renglon (list (cons 4 (strcat codigo1 "-" codigo)) (cons 0 (rtos (distance verpol1 verpol) 2 3)) (cons 1 aa) (cons 5 codigo1) (cons 3 Ypol1) (cons 2 Xpol1) (cons 6 elevacion1)))
     (setq CONCATENADO (cons cuever renglon))
     (setq matrizcuadro (append matrizcuadro (list CONCATENADO)))
     (setq cuever (+ cuever 1))
     (setq block1 block)
     (setq xpol1 xpol)
     (setq ypol1 ypol)
     (setq codigo1 codigo)
     (setq verpol1 verpol)
    )
   ) ;IF
 );WHILE
 (alert "llegue")
 (setq a (angtos (angle verpol1 verpolI)))
 (setq aa (formato a))
 (setq renglon (list (cons 4 (strcat codigo1 "-" codigoi)) (cons 0 (rtos (distance verpol1 verpolI) 2 3)) (cons 1 aa) (cons 5 codigo1) (cons 3 Ypol1) (cons 2 Xpol1) (cons 6 elevacion1)))
 (setq CONCATENADO (cons cuever renglon))
 (setq matrizcuadro (append matrizcuadro (list CONCATENADO)))
 (SETQ PDESCARGA (GETPOINT "ESQUINA INFERIOR IZQUIERDA DEL CUADRO :"))
 (setq pdescarga2 pdescarga)
 (SETQ ALTURA (* CUEVER 1.25))
 (SETQ P2 (SUMA PDESCARGA 44.887 (+ ALTURA 5.556)))
 (SETQ XYZ (SUMA PDESCARGA 0 ALTURA))
 (command "zoom" pdescarga p2)
 (COMMAND "INSERt" (STRCAT RUTA "BLOCKS\\cdsemarnat.dwg") xyz "" "" "")
 (COMMAND "EXPLODE" (ENTLASt) "")
 (setq punretx (cons 10 pdescarga))
 (setq punretx2 (cons 11 xyz))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 44.887 0))
 (SETQ P12 (SUMA PDESCARGA 44.887 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 6.58 0))
 (SETQ P12 (SUMA PDESCARGA 6.58 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 11.922 0))
 (SETQ P12 (SUMA PDESCARGA 11.922 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 21.042 0))
 (SETQ P12 (SUMA PDESCARGA 21.042 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 25.933 0))
 (SETQ P12 (SUMA PDESCARGA 25.933 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 32.694 0))
 (SETQ P12 (SUMA PDESCARGA 32.694 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (SETQ P1 (SUMA PDESCARGA 38.842 0))
 (SETQ P12 (SUMA PDESCARGA 38.842 altura))
 (setq punretx (cons 10 p1))
 (setq punretx2 (cons 11 p12))
 (ENTMAKE (LIST '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") PUNRETX PUNRETX2))
 (setq cont4 cuever)
 (repeat cuever
   (COMMAND "INSERt" (STRCAT RUTA "BLOCKS\\lcd.dwg") pdescarga2 "" "" "")
   (COMMAND "EXPLODE" (ENTLASt) "")
   (COMMAND "INSERt" (STRCAT RUTA "BLOCKS\\TEXTOS SEMARNAT.dwg") pdescarga2 "" "" "")
   (COMMAND "EXPLODE" (ENTLASt) "")
   (SETQ GPOTXTP (SSGET "P"))
   (SETQ CONT3 0)
   (setq lineac (cdr (assoc cont4 matrizcuadro)))
   (REPEAT 7
      (setq atributoc (cdr (assoc cont3 lineac)))
      (SETQ ENTX (SSNAME GPOTXTP CONT3))
      (setq nte (STRCAT atributoc))
      (entmod (subst (cons 1 nte) (assoc 1 (entget entx)) (entget entx)))
      (SETQ CONT3 (1+ CONT3))
   )
   (SETQ pdescarga2 (SUMA PDESCARGA2 0 1.25))
   (setq cont4 (1- cont4))
 )
 (COMMAND "VIEW" "R" "PROV")
 (SETVAR "OSMODE" OPCIONESOS)
)

(DEFUN SUMA (P VX VY)
  (SETQ X (CAR P))
  (SETQ Y (CAR (CDR P)))
  (LIST (+ X VX) (+ Y VY) (LAST P))
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
      (setq datang2 datang)
    )
    (setq datang2 datang)
  )
  (setq datang datang2)
)
