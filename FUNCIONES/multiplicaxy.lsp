(DEFUN multiplicaxy (lista carx cary)
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq contciclo 1)
  (setq vg (+ carx cary))
  (setq mediax 0)
  (repeat nelement
    (setq elementoex (substr lista (+ 1 (* vg (1- contciclo))) carx))
    (setq elementoex2 (substr lista (+ 1 carx (* vg (1- contciclo))) cary))
    (if (/= (substr elementoex2 1 1) "x")
      (setq mediax (+ mediax (* (atof elementoex) (atof elementoex2))))
    )
    (setq contciclo (1+ contciclo))
  )
  (setq mediax mediax)
)

;(multiplica "001020020300304004040050500606007060080700907010080111001210" "001010020300302004040050400604007060080400906010070110901210" 3 2)
;(sumacuad "001010020300302004040050400604007060080400906010070110901210" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
