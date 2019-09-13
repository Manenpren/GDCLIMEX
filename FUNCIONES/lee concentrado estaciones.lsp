(DEFUN leeconcentrado (estacion procedencia)
  (setq mtporcentaj nil)
  (if (= procedencia "C")
    (setq diradicional "CLICOM")
    (setq diradicional "ERIC")
  )
 ;; (if (< (atoi estacion) 10000)(setq estacion (strcat "0" (itoa(atoi estacion)))))
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\evapora\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\evapora\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 1 "XXXXXX"))
    (setq concatenado (concentradod 1))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\evapora\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\granizo\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\granizo\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 2 "XXXXXX"))
    (setq concatenado (concentradod 2))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\granizo\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\hp\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\hp\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 3 "XXXXXX"))
    (setq concatenado (concentradod 3))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\hp\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\neblina\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\neblina\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 4 "XXXXXX"))
    (setq concatenado (concentradod 4))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\neblina\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\nublado\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\nublado\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 5 "XXXXXX"))
    (setq concatenado (concentradod 5))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\nublado\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\rayos\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\rayos\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 6 "XXXXXX"))
    (setq concatenado (concentradod 6))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\rayos\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\temp\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\temp\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 7 "XXXXXX"))
    (setq concatenado (concentradod 7))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\temp\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\tempmax\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\tempmax\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 8 "XXXXXX"))
    (setq concatenado (concentradod 8))
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\tempmax\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\tempmin\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
  (setq archIVOindice (open (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\tempmin\\" estacion ".idx") "r"))
  (if (= archivoindice nil)
    (setq concatenado (cons 9 "XXXXXX"))
    (setq concatenado (concentradod 9))
  )
  (if (/= archivoindice nil)
    (progn
      (close archivoindice)
      (dos_encrypt (strcat ruta "BASES DE DATOS\\DATOS CLIMATOLOGICOS\\" diradicional "\\tempmin\\" estacion ".idx") (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" estacion "Ga4TykP8G5Umo9Ye513"))
    )
  )
  (setq mtporcentaj (append mtporcentaj (list CONCATENADO)))  
)

(defun concentradod (ndatoclim)
  (setq lconcentrados (read-line archIVOindice))
  (setq lconcentrados (descompacta lconcentrados))
  (setq caor (substr lconcentrados 18 4))
  (setq lconcentrados (substr lconcentrados 1 (+ 21 (* (atoi caor) 9))))
  (setq entrega (cons ndatoclim lconcentrados))
)