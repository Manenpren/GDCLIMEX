(defun vertice (poli nov)
  (if (/= entpolilinea poli)
    (progn
      (setq entpolilinea poli)
      (setq listap (entget poli))
      (setq nver 1)
      (setq salir "N")
      (SETQ matrizpol NIL)
      (while (= salir "N")
        (setq sublisp (car listap))
        (if (= 10 (car sublisp))
          (progn
            (setq punto (cdr sublisp))  
            (setq CONCATENADO (cons nver punto))        
            (setq matrizpol (append matrizpol (list CONCATENADO)))
            (setq nver (+ nver 1))
          )
        )
        (setq listap (cdr listap))
        (if listap
          (setq salir "N")
          (setq salir "S")
        )
      );while
    )
  )
  (setq punto (cdr (assoc nov matrizpol)))
)


