(defun persistand (ESTACION procedencia variable fechaini tipodat tipoproceso) 
  (C:LIBRERIA "correlacionr")
  (C:LIBRERIA "lee datos estacion")
  (if (= variable 1) (setq anchochr 6))
  (if (= variable 2) (setq anchochr 1))
  (if (= variable 3) (setq anchochr 6))
  (if (= variable 4) (setq anchochr 1))
  (if (= variable 5) (setq anchochr 1))
  (if (= variable 6) (setq anchochr 1))
  (if (= variable 7) (setq anchochr 5))
  (if (= variable 8) (setq anchochr 5))
  (if (= variable 9) (setq anchochr 5))
  (setq datoex (leebd estacion procedencia variable fechaini tipodat tipoproceso))
  (setq anchobdat (strlen datoex))
  (setq ndatt (/ (strlen datoex) (+ 4 anchochr)))
  (if (> ndatt 27)
    (setq nciclosp 25)
  )
  (if (and (> ndatt 3) (< ndatt 28))
    (setq nciclosp (- ndatt 3))
  )
  (if (< ndatt 4)
    (setq resultado "no")
  )
  (setq reportelist "")
  (setq reportelist2 NIL)
  (setq CONCATENADO (cons 1 ndatt))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (setq CONCATENADO (cons 2 ""))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (setq CONCATENADO (cons 3 ""))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (if (/= resultado "no")
    (progn
      (setq contp 1)
      (repeat nciclosp
        (setq rango95 (/ (1- (* 1.96 (sqrt (- ndatt contp 1)))) (- ndatt contp)))
        (setq rango99 (/ (1- (* 2.326 (sqrt (- ndatt contp 1)))) (- ndatt contp)))
        (setq lista1 (substr datoex 1 (- anchobdat (* contp (+ 4 anchochr)))))
        (setq lista2 (substr datoex (1+ (* contp (+ 4 anchochr)))))
        (if (/= lista1 "")
          (setq correlacion (correlacionr lista1 lista2 4 ANCHOCHR))
          (setq correlacion 0.00)
        )
        (if (>= correlacion 0)
          (if (< rango95 correlacion) (setq resultado "ERROR"))
        )
        (if (< correlacion 0)
          (if (> (* rango95 -1.00) correlacion) (setq resultado "ERROR"))
        )
        (setq reportelist (strcat reportelist (ntocad contp 0 2) (ntocad rango95 3 5) (ntocad correlacion 5 8)))
        (setq contp (1+ contp))
      )
    )
  )
  (setq CONCATENADO (cons 4 reportelist))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (IF (= RESULTADO "ERROR")
    (setq CONCATENADO (cons 5 "El resultado del test de independencia  es NEGATIVO, SE encontraron problemas de independencia"))
    (setq CONCATENADO (cons 5 "El resultado del test de independencia  es POSITIVO, NO encontraron problemas de independencia"))
  )
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (setq reportelist reportelist)
)

;(persistand "16002" "C" 3 "19001" "AN" "MA")