(defun C:corr ()
  (COMMAND "UNDO" "M")
  (COMMAND "VIEW" "S" "CAMCOL")
  (setq PROV (CAR (ENTSEL "SELECCIONA BLOCK")))
  (setq NOMBLO (cdr (assoc 2 (entget PROV))))
  (COMMAND "INSERT" NOMBLO "0,0" "" "" "")
  (SETQ X (ENTLAST))
  (COMMAND "EXPLODE" X "")
  (SETQ GPOa (SSGET "P"))
  (SETQ P 0)
  (WHILE (/= (cdr (assoc 0 (entget PROV))) "TEXT")
    (SETQ PROV (SSNAME GPOA P))
    (SETQ P (1+ P))
  )
  (setq XY (cdr (assoc 10 (entget PROV))))
  (COMMAND "ZOOM" "C" XY "20")
  (SETQ NLAYER "PROYECTO")
  (BRLAYER NLAYER)
  (COMMAND "MOVE" GPOA "0,0" "0,0")
)

(defun brlayer (layer)
  (SETQ P 0)
  (SETQ GPOP (SSADD))
  (SETQ PROV (SSNAME GPOA P))
  (WHILE (/= PROV NIL)
    (SETQ P (1+ P))
    (SETQ PROV (SSNAME GPOA P))
    (IF (/= PROV NIL)
      (IF (= (cdr (assoc 8 (entget PROV))) LAYER)
        (PROGN
         (SETQ GPOP (SSADD PROV))
         (SSDEL PROV GPOA)
         (SETQ P (1- P))
        )
      )
    )
  )
  (COMMAND "ERASE" GPOP "")
)