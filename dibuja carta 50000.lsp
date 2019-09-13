(defun c:dibujac1 ()
  (C:LIBRERIA "DECIMALTOSEXAGESIMAL2")
  (C:LIBRERIA "UTM-GEO")
  (C:LIBRERIA "esquinas de carta topografica")
  (SETQ xyz (GETPOINT "\n Punto a dibujar la carta "))
  (setq xyz (list (car xyz) (cadr xyz)))
  (if (= zonah nil) (setq zonah "00"))
  (SETQ zonah1 (GETSTRING (strcat "\n ZONA UTM HORARIA <" zonah ">:")))
  (IF (/= zonah1 "")
    (SETQ zonah zonah1)
  )
  (CARTAINGr (UTM-GEO xyz (ATOI ZONAH)))
)