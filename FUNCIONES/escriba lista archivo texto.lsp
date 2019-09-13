(DEFUN wrtfile (lista carx cary nmarch carr)
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq contciclo 1)
  (setq vg (+ carx cary))
  (setq mediax 0)
  (setq archIVOwrt (open nmarch "w"))
  (repeat nelement
    (setq elementoex (substr lista (+ 1 (* vg (1- contciclo))) carx))
    (setq elementoey (substr lista (+ 1 carx (* vg (1- contciclo))) cary))
    (setq lescrib (strcat elementoex carr elementoey))
    (write-line lescrib archivowrt)
    (setq contciclo (1+ contciclo))
  )
  (close archivowrt)
)

;(sumacuad "001320024500367004100050601004050120705503898" 3 2)
;(sumacuad "0013200245003670041000506010040501207055" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
