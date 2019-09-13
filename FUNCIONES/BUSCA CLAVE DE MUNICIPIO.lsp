(DEFUN CLAVEMUNI (TEXTOF)
  (C:LIBRERIA "SEPARA VALORES DE COMAS DE UN TEXTO TO LISTA")
  (setq archIVOCL (open (strcat ruta "BASES DE DATOS\\MUNICIPIOS.CSV") "r"))
  (setq lINEAfUENTE (read-line archIVOCL))
  (while lineafuente
    (SETQ VALORES (SEPARA_VAL_COMAS LINEAFUENTE))
    (setq nombremuni (cdr (assoc 4 valores)))
    (IF (= (WCMATCH (strcase nombremuni) (strcat "*" (strcase textof) "*")) T)
      (progn
        (setq clavemunicipio (cdr (assoc 3 valores)))
        (setq lineafuente nil)
      )
      (progn
        (setq clavemunicipio nil)
        (setq lINEAfUENTE (read-line archIVOCL))
      )
    )
  )
  (IF (= CLAVEMUNICIPIO NIL) (PROGN (ALERT "MUNICIPIO NO ENCONTRADO") (SETQ CLAVEMUNICIPIO "0")))
  (close archivocl)
  (print clavemunicipio)
)

