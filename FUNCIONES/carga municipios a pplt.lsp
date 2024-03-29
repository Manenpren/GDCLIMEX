(defun lmupp (klist mun)
  (C:LIBRERIA "SEPARA VALORES DE COMAS DE UN TEXTO TO LISTA")
  (start_list klist 3 0)
  (end_list)
  (setq archdim (open (strcat ruta "bases de datos\\municipios\\" (itoa mun) ".lco") "r"))
  (setq lINEAfUENTE (read-line archdim))
  (setq contador 0)
  (WHILE lINEAfUENTE /= ""
      (setq lineafuente (SEPARA_VAL_COMAS lineafuente))
      (setq lineafuente (strcat (cdr (assoc 1 lineafuente)) "-" (cdr (assoc 2 lineafuente))))
      (start_list klist 2 contador)
      (add_list lINEAfUENTE)
      (end_list)
      (setq contador (1+ contador))
      (setq lINEAfUENTE (read-line archdim))
  )
  (close archdim)
)