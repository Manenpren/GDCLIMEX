(defun c:LIM ()
  (COMMAND "UNDO" "M")
  (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
  (SETQ GPOC (SSGET "X" '((0 . "CIRCLE"))))
  (SETQ E (SSNAME GPOC 0))
  (SETQ XYZ2 (cdr (assoc 10 (entget E))))
  (COMMAND "ERASE" GPOC "")
  (COMMAND "BOUNDARY" XYZ2 "")
  (SETQ LIN (ENTLAST))
  (COMMAND "HATCH" "" "15" "" LIN "")
  (SETQ HAT (ENTLAST))
  (SETQ P1 (SUMA XYZ2 -350 -350))
  (SETQ P2 (SUMA XYZ2 -350 350))
  (SETQ P3 (SUMA XYZ2 350 350))
  (SETQ P4 (SUMA XYZ2 350 -350))
  (COMMAND "ERASE" "ALL" "R" "CP" P1 P2 P3 P4 "" "")
  (COMMAND "PLINE" P1 P2 P3 P4 "C")
  (SETQ LMP (ENTLAST))
  (SETQ VLIMPIA 1)
  (SETQ NA LMP)
  (SETQ P1 (SUMA XYZ2 500 500))
  (LOAD (STRCAT RUTA "LIMPIACAHP"))
  (C:LIMPICH)
  (COMMAND "ZOOM" "E")
  (COMMAND "COPY" "ALL" "" "0,0" "0,0")
  (COMMAND "SCALE" "ALL" "R" (SSGET "P") "" XYZ2 "0.02")
  (SETQ GPOCR (SSGET "P"))
  (COMMAND "_copybase" XYZ2 GPOCR "")
  (COMMAND "ERASE" GPOCR "")
  (PROMPT "SELECCIONA LOS COLINDANTES")
  (SETQ GPOCOL (SSGET))
  (COMMAND "BLOCK" "COLINDANTES" "0,0" GPOCOL "")
  (COMMAND "ERASe" GPOCOL "")
  (COMMAND "OFFSET" "30" LIN (SUMA XYZ2 400 0) "")
  (SETQ LIN2 (ENTLAST))
  (SETQ NA LIN2)
  (SETQ P1 (SUMA XYZ2 450 0))
  (C:LIMPICH)
  (COMMAND "INSERT" "COLINDANTES" "0,0" "" "" "")
  (COMMAND "EXPLODE" (ENTLAST) "")
  (COMMAND "ERASE" LIN2 HAT "")
  (setq name (getvar "dwgname"))                  ;NOMBRE
  (SETQ LNG (STRLEN NAME))
  (SETQ NAME (STRCAT "Sr. " (SUBSTR NAME 1 (- LNG 4))))
  (SETQ LNG (STRLEN NAME))
  (SETQ FIN (SUBSTR NAME (- LNG 1) 1))
  (IF (OR (= FIN "1") (= FIN "2") (= FIN "3") (= FIN "5") (= FIN "6") (= FIN "7") (= FIN "8") (= FIN "9"))
    (SETQ NAME (SUBSTR NAME 1 (- LNG 1)))
  )
  (SETQ ARCPL (OPEN "c:\\PP.TMP" "r"))
  (SETQ LNPL (READ-LINE arcPL))
  (CLOSE ARCPL)
  (setq numeropl (1+ (atoi lnpl)))
  (SETQ NUMSTR (ITOA NUMEROPL))
  (SETQ ARCPL (OPEN "c:\\PP.TMP" "w"))
  (WRITE-LINE NUMSTR ARCpl)
  (CLOSE ARCPL)
  (COMMAND "INSERT" (STRCAT RUTA "BLOCKS\\PPTAC") PAUSE "" "" "")
  (setq PTPP (cdr (assoc 10 (entget (ENTLAST))))) 
  (COMMAND "INSERT" "TXP" PTPP "" "" "")
  (COMMAND "EXPLODE" (ENTLAST) "" "CHANGE" "P" "" "" "" "" "" "" NAME)
  (COMMAND "INSERT" "TXN" PTPP "" "" "")
  (COMMAND "EXPLODE" (ENTLAST) "" "CHANGE" "P" "" "" "" "" "" "" NUMEROPL)
  (COMMAND "INSERT" "TXS" PTPP "" "" "")
  (COMMAND "EXPLODE" (ENTLAST) "")
  (SETQ TXTSC (ENTLAST))
  (COMMAND "_pasteclip" PAUSE)
  (SETQ VLIMPIA NIL)
)

(defun suma (punto xx yy)
  (setq xxx (car punto))
  (setq yyy (car (cdr punto)))
  (setq xxx (+ xxx xx))
  (setq yyy (+ yyy yy))
  (list xxx yyy)
)