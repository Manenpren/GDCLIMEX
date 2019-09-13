(DEFUN mediaar (lista carx cary)
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq contciclo 1)
  (setq vg (+ carx cary))
  (setq mediax 0)
  (setq nelementx nelement)
  (repeat nelement
    (setq elementoex (substr lista (+ 1 carx (* vg (1- contciclo))) cary))
    (if (/= (substr elementoex 1 1) "x")
      (setq mediax (+ mediax (atof elementoex)))
      (setq nelementx (1- nelementx))
    )
    (setq contciclo (1+ contciclo))
  )
  (setq mediax (/ mediax nelementx))
)

;(mediaar "001320024500367004100050601004050120705503898" 3 2)
;(mediaar "0013200245003670041000506010040501207055" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
