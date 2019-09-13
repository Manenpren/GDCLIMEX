(DEFUN NOMBRELOCALIDAD (TEXTOF)
  (C:LIBRERIA "SEPARA VALORES DE COMAS DE UN TEXTO TO LISTA")
  (setq archIVOCL (open (strcat ruta "BASES DE DATOS\\LOCALIDADES.CSV") "r"))
  (setq lINEAfUENTE (read-line archIVOCL))
  (while lineafuente
    (SETQ VALORES (SEPARA_VAL_COMAS LINEAFUENTE))
    (setq clavemunicipio (cdr (assoc 3 valores)))
    (IF (= CLAVEMUNICIPIO TEXTOF)
      (progn
        (setq nombremuniCIPIO (cdr (assoc 10 valores)))
        (setq lineafuente nil)
      )
      (progn
        (setq NOMBREmunicipio nil)
        (setq lINEAfUENTE (read-line archIVOCL))
      )
    )
  )
  (close archivocl)
  (print NOMBREmunicipio)
)

