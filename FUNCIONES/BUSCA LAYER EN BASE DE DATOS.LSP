(DEFUN BSLAYER (LAYBUS)
   (SETQ LAYPROV (tblnext "layer" T))
   (SETQ FIND "N")
   (WHILE LAYPROV
     (IF (= (cdr (assoc 2 LAYPROV)) LAYBUS)
       (PROGN
         (SETQ LAYPROV NIL)
         (SETQ FIND "S")
       )
       (SETQ LAYPROV (tblnext "layer"))
     )
   )
   (PRINT FIND)
)

