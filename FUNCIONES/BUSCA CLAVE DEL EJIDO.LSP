(DEFUN CLAVEJIDO (NOMBREJIDO textof2)
  (C:LIBRERIA "SEPARA VALORES DE COMAS DE UN TEXTO TO LISTA")
  (setq archIVOCL (open (strcat ruta "BASES DE DATOS\\EJIDOS.CSV") "r"))
  (setq lINEAfUENTE (read-line archIVOCL))
  (while (/= lineafuente nil)
    (SETQ VALORES (SEPARA_VAL_COMAS LINEAFUENTE))
    (setq nombremuni (cdr (assoc 4 valores)))
    (setq clavemunicipio2 (cdr (assoc 1 valores)))
    (IF (= (atoi clavemunicipio2) (atoi textof2))
      (IF (= (WCMATCH (strcase nombremuni) (strcat "*" (strcase NOMBREJIDO) "*")) T) 
       (progn
          (setq clavemunicipio (cdr (assoc 2 valores)))
          (setq lineafuente nil)
        )
        (setq lINEAfUENTE (read-line archIVOCL))
      )
      (progn
        (setq clavemunicipio nil)
        (setq lINEAfUENTE (read-line archIVOCL))
      )
    )
  );WHILE
  (close archivocl)
  (IF (= CLAVEMUNICIPIO NIL) (PROGN (ALERT "EJIDO NO ENCONTRADO") (SETQ CLAVEMUNICIPIO "0")))
  (print clavemunicipio)
)

