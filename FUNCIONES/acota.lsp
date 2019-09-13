(defun acotax (linea escalacot)
  (C:LIBRERIA "ENCUENTRA SENTIDO POLILINEA")
  (setq TipEnt (cdr (assoc 0 (entget linea)))) 
  (setq tipent (strcase tipent))
  (if (and (/= "LWPOLYLINE" TipEnt) (/= "LINE" TipEnt) (/= "ARC" TipEnt))
    (alert "La entidad que seleccionaste no es una linea")
  ) 
  (if (= tipent "LWPOLYLINE")
    (SETQ RES (SENTPOL linea))
    (SETQ RES nil)
  )
  (command "copy" linea "" "0,0" "0,0")
  (SETQ PRV (cdr (assoc 0 (entget linea))))
  (SETQ PRV (STRCASE PRV))
  (IF (=  PRV "LWPOLYLINE") 
    (PROGN
      (command "explode" (entlast) "")
      (setq gpoacot (ssadd))
      (setq gpoacot (ssget "p"))
    )
    (SETQ GPOACOt (SSADD LINEA))
  )
  (SETQ E (SSNAME GPOACOT 0))
  (setq cont 0)
  (WHILE E
    (SETQ PRV (cdr (assoc 0 (entget E))))
    (SETQ PRV (STRCASE PRV))
    (IF (= PRV "ARC")
      (PROGN
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
    )
  (setq distancia2 (distance xyz xyz2))
  (IF (= PRV "ARC")
    (progn 
      (setq ang (angle xyz xyz2))
      (setq ang (* 180 (/ ang pi)))
      (IF (= RES "HORARIO") 
        (PROGN
          (if (or (< ang 90) (> ang 270))
            (progn
              (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA2") (polar XYZ (angle XYZ XYZ2) (/ DISTANCIA2 2)) escalacot "" ang "" "")
            )
          )
          (if (and (>= ang 90) (<= ang 270))
            (progn
              (setq ang (+ ang 180))
              (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA") (polar XYZ (angle XYZ XYZ2) (/ DISTANCIA2 2)) escalacot "" ang "" "")
            )
          )
        )
        (PROGN
          (if (or (< ang 90) (> ang 270))
            (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA") (list xc3 yc3) escalacot "" ang "" "")
          )
          (if (and (>= ang 90) (<= ang 270))
            (progn
              (setq ang (+ ang 180))
              (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA2") (list xc3 yc3) escalacot "" ang "" "")
            )
          )
        )
      )
    )
    (progn 
      (setq ang (angle xyz xyz2))
      (setq ang (* 180 (/ ang pi)))
      (IF (= RES "HORARIO") 
        (PROGN
          (if (or (< ang 90) (> ang 270))
            (progn
              (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA2") (polar XYZ (angle XYZ XYZ2) (/ DISTANCIA2 2)) escalacot "" ang "" "")
            )
          )
          (if (and (>= ang 90) (<= ang 270))
            (progn
              (setq ang (+ ang 180))
              (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA") (polar XYZ (angle XYZ XYZ2) (/ DISTANCIA2 2)) escalacot "" ang "" "")
            )
          )
        )
        (PROGN
          (if (or (< ang 90) (> ang 270))
            (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA") (polar XYZ (angle XYZ XYZ2) (/ DISTANCIA2 2)) escalacot "" ang "" "")
          )
          (if (and (>= ang 90) (<= ang 270))
            (progn
              (setq ang (+ ang 180))
              (command "INSERT" (STRCAT RUTA "BLOCKS\\COTA2") (polar XYZ (angle XYZ XYZ2) (/ DISTANCIA2 2)) escalacot "" ang "" "")
            )
          )
        )
      )
    )
  )
  (SETQ ENTP (ENTLAST))
  (SETQ ENTP (ENTNEXT ENTP))
  (COMMAND "ATTEDIT" "" "" "" "" ENTP "V" "R" (rtos distancia 2 3) "")
  (SETQ CONT (1+ CONT))
  (SETQ E (SSNAME GPOACOT cont))
  )
  (command "erase" gpoacot "")
  (setq  opllamado nil)
)