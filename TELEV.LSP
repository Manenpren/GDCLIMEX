(DEFUN C:TELEV ()
  (SETQ GPOT (SSGET))
  (SETQ P 0)
  (SETQ PROV 1)
  (WHILE (/= prov nil)
   (SETQ PROV (SSNAME GPOT P))
   (setq XY (cdr (assoc 10 (entget PROV))))
   (SETQ Y (CADR XY))
   (SETQ Y (RTOS Y 2 0))
   (IF (= (cdr (assoc 0 (entget PROV))) "TEXT")
      (IF (= (cdr (assoc 8 (entget PROV))) "RETICULA")
       (COMMAND "CHANGE" PROV "" "" "" "" "" "" Y)
      )
    )
    (SETQ P (1+ P))
  )
)
