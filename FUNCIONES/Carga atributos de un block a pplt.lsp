(defun ldattpp (klist)
  (start_list klist 3 0)
  (end_list)
  (setq contador 1)
  (SETQ PROB (cdr (assoc 1 datos2)))
  (WHILE PROB
    (IF (/= PROb nil) 
     (progn
      (start_list klist 2 contador)
      (add_list prob)
      (end_list)
     )
    )
    (setq contador (1+ contador))
    (SETQ PROB (cdr (assoc contador datos2)))
  )
)