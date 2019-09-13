(DEFUN mediana (lista carx cary)
  (C:LIBRERIA "ordena lista")
  (setq lista2 (ordenalista lista carx cary "D"))
  (setq vg (+ carx cary))
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (if (/= (fix (/ nelement 2.0)) (/ nelement 2.0)) 
    (progn
      (setq medianax (substr lista2 (+ 1 carx (* vg (fix (/ nelement 2)))) cary))
    )
    (progn
      (setq medianax1 (substr lista2 (+ 1 carx (* vg (1- (/ nelement 2)))) cary))
      (setq medianax2 (substr lista2 (+ 1 carx (* vg (/ nelement 2))) cary))
      (setq medianax (rtos (/ (+ (atof medianax1) (atof medianax2)) 2) 2 4))
    )
  )
  (setq medianax medianax)
)

;(mediana "001320024500367004100050601004050120705503898" 3 2)
;(mediana "0013200245003670041000506010040501207055" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
