(DEFUN ASOC_AL (OBJ N_ASOCIA R)
  (SETQ R (assoc N_ASOCIA (entget E)))
)

(DEFUN ASOC_VAL (OBJ N_ASOCIA R)
  (SETQ R (cdr (assoc N_ASOCIA (entget E))))
)
