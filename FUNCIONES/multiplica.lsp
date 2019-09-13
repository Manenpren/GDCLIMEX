(DEFUN multiplica (lista lista2 carx cary)
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq contciclo 1)
  (setq vg (+ carx cary))
  (setq mediax 0)
  (repeat nelement
    (setq elementoex (substr lista (+ 1 carx (* vg (1- contciclo))) cary))
    (setq elementoex2 (substr lista2 (+ 1 carx (* vg (1- contciclo))) cary))
    (setq mediax (+ mediax (* (atof elementoex) (atof elementoex2))))
    (setq contciclo (1+ contciclo))
  )
  (setq mediax (/ mediax nelement))
)

;(multiplica "001020020300304004040050500606007060080700907010080111001210" "001010020300302004040050400604007060080400906010070110901210" 3 2)
;(sumacuad "001010020300302004040050400604007060080400906010070110901210" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
