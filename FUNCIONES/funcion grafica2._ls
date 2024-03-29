(DEFUN ggrafic ()
  (C:LIBRERIA "ranges")
  (C:LIBRERIA "indice graficos fechas2")
  (desactiva3 "PR1")
  (desactiva3 "PR2")
  (desactiva3 "PR3")
  (desactiva3 "PR4")
  (desactiva2 "mapa")
  (desactiva3 "SEL1")
  (fill_image 0 0 773 624 252)
  (setq estanumeindice 0)
  (setq ncicloscont 1)
  (setq conteric 0)
  (setq indicerangsum 10)
  (setq contcli 0)
  (setq ntestm (+ nestfc nestfe))
  (setq nestclic nestfc)
  (setq nesterics nestfe)
  (setq numeroindicef "01")
  (setq numeroindicet "001")
  ;;(muestraestace)
  (fill_image 591 52 171 20 105)
  (setq slidexx "BTNGRF(GRF)")
  (slide_image 0 0 761 381 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (fill_image 0 381 166 17 105)
  (setq slidexx "BTNGRF(indice)")
  (slide_image 0 381 166 238 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (fill_image 166 381 248 20 105)
  (setq slidexx "BTNGRF(datosg)")
  (slide_image 166 381 248 243 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (setq slidexx "BTNGRF(datosg)")
  (slide_image 166 381 248 243 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (activa2 "TOOLSGRF")
  (ACTIVA2 "INDICES")
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC14"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC01"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC02"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC03"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC04"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC05"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC06"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC07"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC08"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC09"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC10"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC11"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC12"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC13"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "INDIR"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ2 274 "DATOSF6"))
  (setq ral1 -242)
  (setq ral2 70)
  (setq rbl1 -7)
  (setq rbl2 192)
  (setq ranga1 88)
  (setq ranga2 400)
  (setq rangb1 350)
  (setq rangb2 550)
  (rangosest)
  (rgrafica2)
  (setq estacion (car(nestacc2 nest)))
  (stexto ESTACION "romans" 20 342 412)
  (stexto (nombreestado) "romans" 20 170 412) 
  (stexto (denominacion) "romans" 20 170 448)
  (setq colorxh (substr vargrf2 1 3))
  (muestracl colorxh 373 584 36 36)
  (dibujarect 370 581 411 622 20)
  (muestraestace) 
)

(defun dcolor2 (elev)
  (setq resultado "")
  (setq elev (abs elev))
  (if (= elev 1) (setq resultado 7))
  (if (and (< elev 1) (>= elev 0.95)) (setq resultado 140))
  (if (and (< elev 0.95) (>= elev 0.9)) (setq resultado 100))
  (if (and (< elev 0.9) (>= elev 0.8)) (setq resultado 50))
  (if (and (< elev 0.8) (>= elev 0.7)) (setq resultado 42))
  (if (and (< elev 0.7) (>= elev 0.5)) (setq resultado 30))
  (if (and (< elev 0.5) (>= elev 0.25)) (setq resultado 1))
  (if (and (< elev 0.25) (>= elev 0.0)) (setq resultado 6))
  (setq resultado resultado)
)

(defun nestaciones (ncorrelac)
  (setq contestn 1)
  (setq varprvn 2)
  (while (AND (/= varprvn ncorrelac) (> NCORRELAC CONTESTN))
    (setq contestn (1+ contestn))
    (IF (= contestn 2)
      (setq varprvn (+ varprvn 1))
      (setq varprvn (+ varprvn contestn))
    )
  )
  (setq contestn (1+ contestn))
)

(defun generamatrizc (LISTAcorrelaciones NCORRELA nestactbl)
  (setq contestnr 1)
  (setq varprvn NCORRELA)
  (setq varprvn2 NCORRELA)
  (setq descu1 1)
  (setq descu2 2)
  (setq resultado "")
  (repeat nestactbl
    (setq contestn 1)
    (repeat (1- contestnr)
      (setq varprvn2x (+ varprvn2 (1- contestn)))
      (setq resultado (strcat resultado (substr LISTAcorrelaciones (1+ (* 20 (1- varprvn2x))) 20)))
      (setq contestn (1+ contestn))
    )
    (if (> contestnr 1)
      (progn
        (setq varprvn2 (- varprvn2 descu2))
        (setq descu2 (1+ descu2))
        (setq contestn (1+ contestn))
      )
      (setq contestn (1+ contestn))
    )
    (setq resultado (strcat resultado "xxxxxxxxxxxxxxxxxxxx"))
    (setq varprvn2x varprvn)
    (setq bandera 0)
    (repeat (- nestactbl contestnr)
      (if (= bandera 1)
        (setq varprvn2x (- varprvn2x (1- contestn)))
        (setq bandera 1)
      )
      (setq resultado (strcat resultado (substr LISTAcorrelaciones (1+ (* 20 (1- varprvn2x))) 20)))
      (setq contestn (1+ contestn))
    )
    (setq varprvn (- varprvn descu1))
    (setq descu1 (1+ descu1))
    (setq contestnr (1+ contestnr))
  )
  (setq resultado resultado)
)

(defun muestraestace()
  (setq clicmues 0)
  (setq ericmues 0)
  (setq numestaes "")
  (setq estanext "")
  (setq estaback "")
  (fill_image 675 74 80 289 31)
  (fill_image 675 83 80 13 252)
  (fill_image 675 350 80 13 252)
  ;(setq yestar 100)
  (stexto "ESTACIONES" "romansng" 12 682 73)
  (if xestar "")(progn
  (setq xestar 694)
  (setq yestar 100))
  (setq ntestn (abs(- ntestm (* 14 (1- ncicloscont))))) ;
  (if (<= ntestn 14)(setq rep ntestn)(setq rep 14))
  	(repeat rep
		(if (/= nestclic 0)
		  (progn
		  (setq numestaes (cadr (assoc (1+ contcli) estaciones3)))
		  (setq contcli (1+ contcli))
		  (setq nestclic (1- nestclic))
		  (setq clicmues (1+ clicmues))
		  (fill_image 680 yestar 68 12 39)
		  (stexto numestaes "romans" 13 xestar yestar )
		  )	
		(progn
		  (setq numestaes (cadr (assoc (1+ conteric) estaciones4)))
		   (setq conteric (1+ conteric))
		   (setq nesterics (1- nesterics))
		    (setq ericmues (1+ ericmues))
		  (fill_image 680 yestar 68 13 37)
		  (stexto numestaes "romans" 13 xestar yestar )
		  )
		  )	 
  		 (setq yestar (+ yestar 18))
	 )
  (if (> ncicloscont 1)
   (progn
   (slide_image  690 83 60 13 (STRCAT RUTA "SLIDES\\" "BTNGRF(NVG1)" ".SLB"))(setq estaback "si"))
   (setq estaback "no"))
  (if (> ntestn 14)
    (progn
      (slide_image  690 350 60 13 (STRCAT RUTA "SLIDES\\" "BTNGRF(NVG2)" ".SLB"))
      (setq estanext "si")
      )
    (setq estanext "no")
    )
  (while (< yestar 349) 
  (fill_image 680 yestar 68 12 252)
  (setq yestar (+ yestar 18))
  )
  ;(colocadata)
)

(defun colocadata()
  (fill_image 169 414 165 19 252)(fill_image 350 415 60 19 252)(fill_image 170 450 165 19 252)
 (if (< estanumeindice nestfc)
  (progn
  (setq  estacion (cadr (assoc (1+ estanumeindice) estaciones3)))
  (stexto estacion "romans" 19 350 414 )
  (setq est (substr "01Aguascalientes      02Baja California     03Baja California Sur 04Campeche            05Coahuila de Zaragoza06Colima              07Chiapas             08Chihuahua           09Distrito Federal    10Durango             11Guanajuato          12Guerrero            13Hidalgo             14Jalisco             15M�xico              16Michoac�n de Ocampo 17Morelos             18Nayarit             19Nuevo Le�n          20Oaxaca              21Puebla              22Quer�taro           23Quintana Roo        24San Luis Potos�     25Sinaloa             26Sonora              27Tabasco             28Tamaulipas          29Tlaxcala            30Veracruz            31Yucat�n             32Zacatecas           " (+ 3 (* (1- (atoi (substr estacion 1 (- (strlen estacion) 3)))) 22)) 20))
  (setq esta (vl-string-trim " " est))
  (stexto esta "romans" 19 170 414 )(SETQ procedencia "Clicom")
  (stexto procedencia "romans" 19 170 450 )
  )
  (progn
    (setq estanumeindice (- estanumeindice nestfc))
    (setq  estacion (cadr (assoc (1+ estanumeindice) estaciones4)))
  (stexto estacion "romans" 19 350 414 )
  (setq est (substr "01Aguascalientes      02Baja California     03Baja California Sur 04Campeche            05Coahuila de Zaragoza06Colima              07Chiapas             08Chihuahua           09Distrito Federal    10Durango             11Guanajuato          12Guerrero            13Hidalgo             14Jalisco             15M�xico              16Michoac�n de Ocampo 17Morelos             18Nayarit             19Nuevo Le�n          20Oaxaca              21Puebla              22Quer�taro           23Quintana Roo        24San Luis Potos�     25Sinaloa             26Sonora              27Tabasco             28Tamaulipas          29Tlaxcala            30Veracruz            31Yucat�n             32Zacatecas           " (+ 3 (* (1- (atoi (substr estacion 1 (- (strlen estacion) 3)))) 22)) 20))
  (setq esta (vl-string-trim " " est))
  (stexto esta "romans" 19 170 414 )(SETQ procedencia "ERIC")
  (stexto procedencia "romans" 19 170 450 )
    )
 )
 ;(indicegenera)
)

(defun indicegenera()
  (SETQ YLIMPIA 404)
 (REPEAT 14
   (fill_image 7 YLIMPIA 68 13 252)
   (SETQ YLIMPIA (+ YLIMPIA 18))
   )
 (if (= procedencia "ERIC")
  (progn 
(setq fechainicia (ATOI(substr(cdr(car(cdr(assoc (1+  estanumeindice) matrizporcentaje2)))) 1 4)))
(setq fechafin  (ATOI(substr(cdr(car(cdr(assoc (1+  estanumeindice) matrizporcentaje2)))) 7 4)))
  )
  (progn
(setq fechainicia (atoi(substr(cdr(car(cdr(assoc (1+  estanumeindice) matrizporcentajc2)))) 1 4)))
(setq fechafin  (atoi(substr(cdr(car(cdr(assoc (1+ estanumeindice) matrizporcentajc2)))) 7 4)))
  ))
    (setq fecha2 0) (setq fecha1 fechainicia)(setq yeaq 404)
 (while (< fecha2 fechafin)
   (setq fecha2 (+ fecha1 indicerangsum))
     (fill_image 7 yeaq 68 13 08)
   (if (< fecha2 fechafin)
   (stexto (strcat (itoa fecha1) (strcat "-" (itoa fecha2))) "romans" 13 8 yeaq )(stexto (strcat (itoa fecha1) (strcat "-" (itoa fechafin))) "romans" 13 8 yeaq ))
   (setq fecha1 fecha2)
   (setq yeaq (+ yeaq 18))
   )
  ;(indicemenores)
)

(defun indicemenores()
  (setq limpiami 0)(setq yclean 404)
(while (< limpiami 10)
  (fill_image 86 yclean 29 12 252)(fill_image 128 yclean 29 12 252)
  (setq limpiami (1+ limpiami))(setq yclean (+ yclean 18))
)  
(setq containdicemenos 0)(setq rep 0)(setq indmenmuest "0")
  (setq ycoloca 404)
  (setq yaclcindice 404)
  (While (< yaclcindice yesta)
    (setq yaclcindice (+ yaclcindice 18))
    (setq containdicemenos (1+ containdicemenos))
  )
  (setq fechaindicemen2  (+ fechainicia (* containdicemenos  indicerangsum)))
    (setq fechaindicemen1 (- fechaindicemen2 indicerangsum ))
  (if (> fechaindicemen2 fechafin)(setq fechaindicemen2 fechafin))
   (if (< fechaindicemen1 fechafin)(progn
    (fill_image 7 (+ 404(* 18 (1- containdicemenos))) 68 12 55)
     (stexto (strcat (itoa fechaindicemen1) (strcat "-" (itoa fechaindicemen2))) "romans" 13 8 (+ 404(* 18 (1- containdicemenos))) )
      ;(if (< (- fechaindicemen2 fechaindicemen1) indicerangsum)(setq indicerangsum (- fechaindicemen2 fechaindicemen1)))
      (if (= indicerangsum 10)(setq ingsum indicerangsum))
      (if (= indicerangsum 20)(setq ingsum (/ indicerangsum 2)))
      (if (= indicerangsum 30)(setq ingsum (/ indicerangsum 3)))
      (if (= indicerangsum 40)(setq ingsum (/ indicerangsum 4)))
      (if (< ingsum 10)( setq rep (1+ ingsum))( setq rep 10))
      (setq contim 0)(setq c rep)(setq fs (/ indicerangsum 10))
      (While (and (> rep 0)(< (atoi indmenmuest) fechafin))
	(setq indmenmuest (itoa(+ fechaindicemen1 (* contim  fs ))))
	(setq contim (1+ contim))
	(fill_image 86 ycoloca 29 12 35)
	(if (> (atoi indmenmuest) fechafin)(setq indmenmuest (itoa fechafin)))
	(stexto indmenmuest "romans" 13 86 ycoloca )
	(setq ycoloca (+ ycoloca 18))
	(setq rep (1- rep))
      )
      (setq ycoloca 404)
      (setq rep (- (1+ ingsum) c))
    (if (< (atoi indmenmuest) fechaindicemen2)
      (repeat rep
	(setq indmenmuest (itoa(+ fechaindicemen1 (* contim fs))))
	(setq contim (1+ contim))
	(fill_image 128 ycoloca 29 12 35)
	(if (> (atoi indmenmuest) fechafin)(setq indmenmuest (itoa fechafin)))
	(stexto indmenmuest "romans" 13 128 ycoloca )
	(setq ycoloca (+ ycoloca 18))
      ) )
))
 )

(defun rgrafica2 ()
  (setq tipogrf "")
  (SETQ tipogrf (investigobj "ACC03"))
  (if (= "1" tipogrf) (setq tipogrf "BR"))
  (if (= tipogrf "0")
    (progn
      (SETQ tipogrf (investigobj "ACC04"))
      (if (= "1" tipogrf) (setq tipogrf "LI"))
    )
  )
  (if (= tipogrf "0")
    (progn
      (SETQ tipogrf (investigobj "ACC05"))
      (if (= "1" tipogrf) (setq tipogrf "DS"))
    )
  )
  (SETQ tipodatf (investigobj "DATOSF1"))
  (SETQ datoclimagrf (investigobj "DATOSF2"))
  (SETQ tipoPROf (investigobj "DATOSF3"))
  (SETQ DATOSFT4 (investigobj "DATOSF4"))
  (SETQ DATOSFT5 (investigobj "DATOSF5"))
  (SETQ DATOSFT5 (investigobj "DATOSF6"))
  ;(setq  (atoi (substr DATCLIMASOBRE 1 1)))
  (if (and (OR (= datoclimagrf 3) (= datoclimagrf 1)) (= tipoPROf "TO") (= tipodatf "AN")) (progn (setq hini 0) (setq hfin 3000)))
  (if (and (OR (= datoclimagrf 3) (= datoclimagrf 1)) (= tipoPROf "TO") (= tipodatf "ME")) (progn (setq hini 0) (setq hfin 400)))
  (if (and (OR (= datoclimagrf 3) (= datoclimagrf 1)) (OR (= tipoPROf "ME") (= tipoPROf "MA") (= tipoPROf "MI")) (OR (= tipodatf "ME") (= tipodatf "AN"))) (progn (setq hini 0) (setq hfin 30)))
  (if (and (= datoclimagrf 3) (= tipoPROf "MA") (OR (= tipodatf "ME") (= tipodatf "AN"))) (progn (setq hini 0) (setq hfin 90)))
  (if (and (OR (= datoclimagrf 7) (= datoclimagrf 8) (= datoclimagrf 9)) (= tipoPROf "TO") (= tipodatf "AN")) (progn (setq hini 0) (setq hfin 15000)))
  (if (and (OR (= datoclimagrf 7) (= datoclimagrf 8) (= datoclimagrf 9)) (= tipoPROf "TO") (= tipodatf "ME")) (progn (setq hini 0) (setq hfin 1500)))
  (if (and (OR (= datoclimagrf 7) (= datoclimagrf 8) (= datoclimagrf 9)) (OR (= tipoPROf "ME") (= tipoPROf "MA") (= tipoPROf "MI")) (OR (= tipodatf "ME") (= tipodatf "AN"))) (progn (setq hini -10) (setq hfin 50)))
  (if (and (OR (= datoclimagrf 2) (= datoclimagrf 4) (= datoclimagrf 5) (= datoclimagrf 6)) (= tipoPROf "TO") (= tipodatf "AN")) (progn (setq hini 0) (setq hfin 400)))
  (if (and (OR (= datoclimagrf 2) (= datoclimagrf 4) (= datoclimagrf 5) (= datoclimagrf 6)) (= tipoPROf "TO") (= tipodatf "ME")) (progn (setq hini 0) (setq hfin 40)))
  (if (and (OR (= datoclimagrf 2) (= datoclimagrf 4) (= datoclimagrf 5) (= datoclimagrf 6)) (AND (/= tipoPROf "TO") (/= tipoPROf "VC")) (OR (= tipodatf "ME") (= tipodatf "AN"))) (progn (setq hini 0) (setq hfin 2)))
  (IF (= tipoPROf "VC")
    (progn 
      (setq hini 10)
      (setq hfin 100)
    )
  )
  (setq nestach nest)
  (if (> nestach nestclic)
    (setq ldatex (cdr (assoc (- nestach nestclic) matrizporcentaje2)))
    (setq ldatex (cdr (assoc nestach matrizporcentajc2)))
  )
  (setq ldatex (cdr (assoc datoclimagrf ldatex)))
  (setq fechainiex (substr ldatex 1 6));cambio de 6 a 4
  (setq fechafinex (substr ldatex 7 6))
 ;(setq fechainiex(itoa(-(atoi fechainiex) 100)))
  (setq fechainiex2 fechainiex)
  (setq fechafinex2 fechafinex)
  (dibujaindicea2 (substr fechainiex2 1 4) (substr fechafinex2 1 4))
  (if (= tipodatf "ST") 
    (progn
      (setq fechafinex2 (strcat (itoa (+ (atoi numeroindicet) (atoi (substr fechainiex 1 4)))) (substr fechainiex 5 2)))
      (setq fechainiex2 (strcat (itoa (+ (1- (atoi numeroindicet)) (atoi (substr fechainiex 1 4)))) (substr fechainiex 5 2)))
    )
  )
  (setq conten 2)
  (SETQ L1ST (substr vargrf2 36 2))
  (SETQ L2ST (substr vargrf2 38 4))
  (SETQ L3ST (substr vargrf2 42 3))
  (setq datoclimasobref 0)
  (if (or (= datoclimagrf 1) (= datoclimagrf 3))
    (progn
      (setq sobreposiciondt l1st)
      (if (= (substr sobreposiciondt 1 1) "1")
        (setq datoclimasobref 1)
      )
    )
  )
  (if (or (= datoclimagrf 2) (= datoclimagrf 4) (= datoclimagrf 5) (= datoclimagrf 6))
    (progn
      (setq sobreposiciondt l2st)
      (if (= (substr sobreposiciondt 1 1) "1")
        (setq datoclimasobref 2)
      )
    )
  )
  (if (or (= datoclimagrf 7) (= datoclimagrf 8) (= datoclimagrf 9))
    (progn
      (setq sobreposiciondt l3st)
      (if (= (substr sobreposiciondt 1 1) "1")
        (setq datoclimasobref 7)
      )
    )
  )
  (setq nciclos (1- (strlen sobreposiciondt)))
  (if (and (= datoclimagrf 3) (= (substr sobreposiciondt 2 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 3)
    )
  )
  (if (and (= datoclimagrf 2) (= (substr sobreposiciondt 1 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 2)
    )
  )
  (if (and (= datoclimagrf 1) (= (substr sobreposiciondt 1 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 1)
    )
  )
  (if (and (= datoclimagrf 4) (= (substr sobreposiciondt 2 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 4)
    )
  )
  (if (and (= datoclimagrf 5) (= (substr sobreposiciondt 3 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 5)
    )
  )
  (if (and (= datoclimagrf 6) (= (substr sobreposiciondt 4 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 6)
    )
  )
  (if (and (= datoclimagrf 7) (= (substr sobreposiciondt 1 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 7)
    )
  )
  (if (and (= datoclimagrf 8) (= (substr sobreposiciondt 2 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 8)
    )
  )
  (if (and (= datoclimagrf 9) (= (substr sobreposiciondt 3 1) "0"))
    (progn
      (setq nciclos 0)
      (setq datoclimasobref 9)
    )
  )
  (if (/= datoclimasobref 0)
    (progn
    (setq nestach (1+ estanumeindice))
    (graficaestac2 (car (nestacc2 nestach)) (substr procedencia 1 1) datoclimasobref "A" "S" "S" colorgrf tipogrf fechainiex2 fechafinex2 hini hfin tipodatf tipoPROf)
  ))
  (repeat nciclos
    (if (and (= (strlen colorgrf) 3) (> conten 2))
      (if (< 253 (atoi colorgrf)) (setq colorgrf (ntocad (- (atoi colorgrf) (* 2 (1- conten))) 0 3)) (setq colorgrf (ntocad (+ (atoi colorgrf) (* 2 (1- conten))) 0 3)))
    )
    (setq datoclimasobref 0)
    (if (or (= datoclimagrf 1) (= datoclimagrf 3))
      (if (= (substr sobreposiciondt conten 1) "1")
        (setq datoclimasobref 3)
      )
    )
    (if (or (= datoclimagrf 2) (= datoclimagrf 4) (= datoclimagrf 5) (= datoclimagrf 6))
      (if (= (substr sobreposiciondt conten 1) "1")
        (progn
          (if (= conten 2)
            (setq datoclimasobref 4)
          )
          (if (= conten 3)
            (setq datoclimasobref 5)
          )
          (if (= conten 4)
            (setq datoclimasobref 6)
          )
        )
      )
    )
    (if (or (= datoclimagrf 7) (= datoclimagrf 8) (= datoclimagrf 9))
      (if (= (substr sobreposiciondt conten 1) "1")
        (progn
          (if (= conten 2)
            (setq datoclimasobref 8)
          )
          (if (= conten 3)
            (setq datoclimasobref 9)
          )
        )
      )
    )
    (print datoclimasobref)
    (if (and (/= estanumeindice nil)(< estanumeindice nestfc))
  (
  (setq  estacion (cadr (assoc (1+ estanumeindice) estaciones3)))
  )
  (progn
    (setq estanumeindice (- estanumeindice nestfc))
    (setq  estacion (cadr (assoc (1+ estanumeindice) estaciones4)))
    )
 )
    (if (/= datoclimasobref 0)
      (graficaestac2 estacion (substr procedencia 1 1) datoclimasobref "A" "N" "N" colorgrf tipogrf fechainiex2 fechafinex2 hini hfin tipodatf tipoPROf)
    )
    (setq conten (1+ conten))
  )
; (dibujarect 602 151 628 419 20)
 
)
(Defun actualizagraf2()
  (fill_image 0 0 773 624 252)
  (setq slidexx "BTNGRF(GRF)")
  (slide_image 0 0 761 381 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (fill_image 0 381 166 17 105)
  (setq slidexx "BTNGRF(indice)")
  (slide_image 0 381 166 238 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (fill_image 166 381 248 20 105)
  (setq slidexx "BTNGRF(datosg)")
  (slide_image 166 381 248 243 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (setq slidexx "BTNGRF(datosg)")
  (slide_image 166 381 248 243 (STRCAT RUTA "SLIDES\\" slidexx ".SLD"))
  (activa2 "TOOLSGRF")
  (ACTIVA2 "INDICES")
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC14"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC01"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC02"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC03"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC04"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC05"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC06"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC07"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC08"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC09"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC10"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC11"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC12"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "ACC13"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ 74 "INDIR"))
  (dibujaelem (BUSOBJBD LISTADCLOBJ2 274 "DATOSF6"))
  (rangosest)
   (setq estacion (car(nestacc2 (1+ estanumeindice))))
   (stexto ESTACION "romans" 20 342 412)
   (stexto (nombreestado) "romans" 20 170 412) 
   (stexto (denominacion) "romans" 20 170 448)
   (setq colorxh (substr vargrf2 1 3))
   (muestracl colorxh 373 584 36 36)
   (dibujarect 370 581 411 622 20)
   (setq nest (1+ estanumeindice))
   (rgrafica2)
   (setq nestmt (- (+ conteric contcli)(* 14 (1- ncicloscont))1))
   (setq nestma (- nestmt (* 14 (1- ncicloscont))))
   (setq nestmc (+ contcli nestclic))
   (setq contcli (- contcli clicmues))
   (setq conteric (- conteric ericmues))
   (setq nesterics (+ nesterics conteric ))
   (setq nestclic (+ nestclic contcli ))  
   (muestraestace)
)  