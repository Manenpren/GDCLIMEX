(defun PTH ()
  (SETQ fX (OPEN "C:\\RUTA PROGRAMAS LISP.txt" "r"))
  (SETQ PATH (READ-LINE FX))
  (IF (= PATH NIL)
   (progn
    (SETQ PATH "C:\\LISPMSA\\")
    (SETQ fX (OPEN "C:\\RUTA PROGRAMAS LISP.txt" "w"))
    (WRITE-LINE "C:\LISPMSA\ "  FX)
    (CLOSE FX)
   )
  )
  (PRINT PATH)
)