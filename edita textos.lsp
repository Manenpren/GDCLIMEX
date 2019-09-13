(defun c:edtx ()
  (command "undo" "m")
  (setq gpo (ssget "x" '((2 . "NOMNUM"))))
  (SETQ NENT (sslength GPO))
  (setq e (ssname gpo (1- NENT)))
  (setq cont (1- NENT))
  (SETQ CONT2 1)
  (while e
    (setq bl (entnext e))
    (COMMAND "attedit" "" "" "" "" bl "V" "R" cont2 "")
    (setq cont (- cont 1))
    (setq cont2 (1+ cont2))
    (setq e (ssname gpo CONT))
  )
)

