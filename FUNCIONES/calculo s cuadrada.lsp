(DEFUN scuad (lista carx cary)
  (C:LIBRERIA "media ar")
  (C:LIBRERIA "d grados de libertad")
  (C:LIBRERIA "suma")
  (C:LIBRERIA "suma cuadrados")
  (setq mediar (mediaar lista carx cary))
  (setq nelement (/ (strlen lista) (+ carx cary)))
  (setq suma2 (sumacuad lista carx cary))
  (setq suma3 (sumax lista carx cary))
  (setq sf (/ (- suma2 (* (/ 1.00 nelement) (expt suma3 2))) nelement))
)

;(scuad "001320024500367004100050601004050120705503898" 3 2)
;(scuad "0013200245003670041000506010040501207055" 3 2)
;lista		cadena		lista de datos en forma de cadena 
;carx		entero		ancho de caracteres en x
;cary		entero		ancho de caracteres en y
 