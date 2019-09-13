(DEFUN ordenalista (lista carx cary opcion)
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq contciclo 1)
  (setq vg (+ carx cary))
  (setq lista2 "")
  (repeat nelement
    (setq elementoex (substr lista (+ 1 carx (* vg (1- contciclo))) cary))
    (setq contciclo2 1)
    (while (and (> contciclo contciclo2) (/= lista2 "") (< (atof (substr lista2 (+ 1 carx (* vg (1- contciclo2))) cary)) (atof elementoex)))
      (setq contciclo2 (1+ contciclo2))
    )
    (if (and (= contciclo contciclo2) (/= lista2 ""))
      (setq lista2 (strcat lista2 (substr lista (+ 1 (* vg (1- contciclo))) carx) elementoex)) 
    )
    (if (and (/= contciclo contciclo2) (/= lista2 ""))
      (SETQ LISTA2 (dos_strinsert lista2 (* vg (1- contciclo2)) (strcat (substr lista (+ 1 (* vg (1- contciclo))) carx) elementoex)))
    )
    (if (= lista2 "") (setq lista2 (strcat (substr lista (+ 1 (* vg (1- contciclo))) carx) elementoex))) ;(setq lista2 (strcat (substr lista (+ 1 (* vg (1- contciclo))) carx) elementoex))
    (setq contciclo (1+ contciclo))
  )
  (if (= opcion "D")
    (progn
      (setq contciclo 1)
      (setq listax "")
      (repeat nelement
        (setq elementoex (substr lista2 (+ 1 (* vg (1- contciclo))) vg))
        (setq listax (strcat elementoex listax))
        (setq contciclo (1+ contciclo))
      )
      (setq lista2 listax)
    )
  )
  (setq lista2 lista2)
)

;(ordenalista "001320024500367004100050601004050120705503898" 3 2 "D")
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
;opcion		cadena		opcion de orden "A" "D" ascendente o descendente