(defun c:v3d ()
  (setq gpo (ssget "x" '((2 . "xv"))))
  (setq ent (ssname gpo 0))
  (setq nent 1)
  (while ent
    (setq xy (cdr (assoc 10 (entget ent))))
    (command "camera" xy "690.8444,93.4643,-148.6328")
    (COMMAND "DELAY" "200")
    (setq ent (ssname gpo nent))
    (setq nent (1+ nent))
  )
)

