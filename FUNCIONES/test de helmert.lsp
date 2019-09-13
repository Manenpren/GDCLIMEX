(DEFUN testhl (lista carx cary)
  (C:LIBRERIA "media ar")
  (setq medianas (mediaar lista carx cary))
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
  (setq conts 0)
  (setq contc 0)
  (repeat (1- nelement)
    (setq result2 (substr test contciclo 1))
    (if (= result1 result2) (setq conts (1+ conts)) (setq contc (1+ contc)))
    (setq contciclo (1+ contciclo))
    (setq result1 result2)
  )
  (setq tolerancia (sqrt (1- nelement)))
  (IF (> (abs (- conts CONTc)) tolerancia)
    (progn
      (IF (> contc CONTs) (SETQ RESULTADO "C>S"))
      (IF (> conts CONTc) (SETQ RESULTADO "S>C"))
    )
    (SETQ RESULTADO "BIEN")
  )
  (setq CONCATENADO (cons 3 (itoa conts)))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (setq CONCATENADO (cons 4 (itoa contc)))
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (IF (= RESULTADO "BIEN")
    (setq CONCATENADO (cons 5 "El resultado del test no encuentra ningun error en los datos"))
    (if (= resultado "C>S")
      (setq CONCATENADO (cons 5 "El resultado del la prueba encontro un error posiblemente de OSCILACION de la serie"))
      (setq CONCATENADO (cons 5 "El resultado del la prueba encontro un error posiblemente de TENDENCIA"))
    )
  )
  (setq reportelist2 (append reportelist2 (list CONCATENADO)))
  (SETQ RESULTADO RESULTADO)
)

;(testhl "001320024500367004100050601004050120705503898" 3 2)
;(testhl "0013200245003670041000506010040501207055" 3 2)
;lista		cadena		lista de datos en forma de ca		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y

;resultado "BIEN" "S>c" "C>S"