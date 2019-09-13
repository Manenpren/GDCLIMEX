(DEFUN pruebasec (lista carx cary)
  (C:LIBRERIA "mediana")
  (setq medianas (atof (mediana lista carx cary)))
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq contciclo 1)
  (setq vg (+ carx cary))
  (setq smas "")
  (setq test "")
  (setq reportelist2 NIL)
  (setq CONCATENADO (cons 1 (itoa nelement)))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (setq CONCATENADO (cons 2 (rtos medianas 2 3)))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (repeat nelement
    (setq elementoex (atof (substr lista (+ 1 carx (* vg (1- contciclo))) cary)))
    (if (> elementoex medianas)
       (setq smas "+")
    )
    (if (<= elementoex medianas)
       (setq smas "-")
    )
    (setq test (strcat test smas))
    (setq contciclo (1+ contciclo))
  )
  (setq contciclo 2)
  (setq result1 (substr test 1 1))
  (setq contcambio 1)
  (repeat (1- nelement)
    (setq result2 (substr test contciclo 1))
    (if (/= result1 result2) (setq contcambio (1+ contcambio)))
    (setq contciclo (1+ contciclo))
    (setq result1 result2)
  )
  (SETQ UMENOR (- (* 0.46 NELEMENT) 1.519))
  (SETQ UMAYOR (+ (* 0.555 NELEMENT) 2.155))
  (SETQ RESULTADO "BIEN")
  (IF (> UMENOR CONTCAMBIO) (SETQ RESULTADO "BAJO"))
  (IF (< UMAYOR CONTCAMBIO) (SETQ RESULTADO "ALTO"))
  (setq CONCATENADO (cons 3 (strcat (rtos umenor 2 3) "-" (rtos umayor 2 3))))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (setq CONCATENADO (cons 4 (itoa contcambio)))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (IF (= RESULTADO "BIEN")
    (setq CONCATENADO (cons 5 "El resultado de la prueba de secuencias no encuentra ningun error en los datos"))
    (if (= resultado "BAJO")
      (setq CONCATENADO (cons 5 "El resultado del la prueba encontro un error posiblemente de TENDENCIA"))
      (setq CONCATENADO (cons 5 "El resultado del la prueba encontro un error posiblemente de OSCILACION de la serie"))
    )
  )
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (SETQ RESULTADO RESULTADO)
)

;(pruebasec "001320024500367004100050601004050120705503898" 3 2)
;(pruebasec "0013200245003670041000506010040501207055" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y

;resultado "BIEN" "ALTO" "BAJO"