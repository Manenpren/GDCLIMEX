(defun lespp (klist)
  (start_list klist 3 0)
  (end_list)
  (setq archdim (open (strcat ruta "bases de datos\\estados.ppl") "r"))
  (setq lINEAfUENTE (read-line archdim))
  (setq contador 0)
  (WHILE lINEAfUENTE /= ""
      (start_list klist 2 contador)
      (add_list lINEAfUENTE)
      (end_list)
      (setq contador (1+ contador))
      (setq lINEAfUENTE (read-line archdim))
  )
  (close archdim)
)