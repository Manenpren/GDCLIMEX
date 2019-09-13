(DEFUN ftofcad (fecha)
  (setq mes (substr fecha 5 2))
  (if (= (atoi mes) 1) (setq mes "ENE"))
  (if (= (atoi mes) 2) (setq mes "FEB"))
  (if (= (atoi mes) 3) (setq mes "MAR"))
  (if (= (atoi mes) 4) (setq mes "ABR"))
  (if (= (atoi mes) 5) (setq mes "MAY"))
  (if (= (atoi mes) 6) (setq mes "JUN"))
  (if (= (atoi mes) 7) (setq mes "JUL"))
  (if (= (atoi mes) 8) (setq mes "AGO"))
  (if (= (atoi mes) 9) (setq mes "SEP"))
  (if (= (atoi mes) 10) (setq mes "OCT"))
  (if (= (atoi mes) 11) (setq mes "NOV"))
  (if (= (atoi mes) 12) (setq mes "DIC"))
  (SETQ FECHA (STRCAT (SUBSTR FECHA 7 2) "-" MES "-" (SUBSTR FECHA 1 4)))
)

;fecha		cadena		de 8 caracteres
 