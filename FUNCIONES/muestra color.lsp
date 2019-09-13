(DEFUN muestracl (color x1 y1 lx ly)
  (setq ncolores (/ (strlen color) 3))
  (setq anchopx (fix (/ lx ncolores)))
  (setq contcolores 0)
  (repeat ncolores
    (setq colord (substr color (1+ (* contcolores 3)) 3))
    (fill_image (+ x1 (* contcolores anchopx)) y1 anchopx ly (atoi colord))
    (setq contcolores (1+ contcolores))
  )
)

;color		cadena		color en formato de tres digitos en formato de cadena
;lx		nummero		longitud del rectangulo en la direccion x en pixeles
;ly		nummero		longitud del rectangulo en la direccion y en pixeles
;x1		numero		coordenada inicial del rectangulo en x
;y1		numero		coordenada inicial del rectangulo en y
