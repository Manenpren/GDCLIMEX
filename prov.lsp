(DEFUN reporte (estacion procedencia datoclim tipod tipop)
  (C:LIBRERIA "lee datos estacion excel")
  (C:LIBRERIA "lee datos estacion")
  (C:LIBRERIA "escriba lista archivo texto")
  (setq lecturaint (leebd estacion procedencia datoclim "190001" tipod tipop))
  (wrtfile lecturaint 4 5 "C:\\x.csv" ",")  
  (Lista->Excel (leebdex estacion procedencia datoclim tipod tipop))
);(reporte "16001" "C" 3 "AN" "MA")
