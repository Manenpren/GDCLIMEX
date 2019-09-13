(DEFUN correlacionr (lista1 lista2 carx cary)
  (C:LIBRERIA "media ar")
  (C:LIBRERIA "suma cuadradosp")
  (C:LIBRERIA "multiplica")
  (if (> (strlen lista1) (+ carx cary))
   (progn
    (setq media1 (mediaar lista1 carx cary))
    (setq media2 (mediaar lista2 carx cary))
    (setq multi (multiplica lista1 lista2 carx cary))
    (setq covar (- multi (* media1 media2)))
    (setq xcuad1 (sumacuadp lista1 carx cary))
    (setq xcuad2 (sumacuadp lista2 carx cary))
    (setq desvia1 (sqrt (- xcuad1 (expt media1 2))))
    (setq desvia2 (sqrt (- xcuad2 (expt media2 2))))
    (setq resultado (/ covar (* desvia1 desvia2)))
   )
   (setq resultado 0)
  )
  (setq resultado resultado)
)

;(correlacionr "001020020300304004040050500606007060080700907010080111001210" "001010020300302004040050400604007060080400906010070110901210" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
 