(DEFUN C:sumav ()
    (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
    (setq block (car (entsel "\n Selecciona block : ")))
    (setq elev1 (busatr block "ELEV"))
    (SETQ BLOCK (ENTNEXT BLOCK))
    (SETQ BLOCK (ENTNEXT BLOCK))
    (COMMAND "ATTEDIT" "" "" "" "" BLOCK "V" "R" (rtos (+ (atof elev1) incre) 2 3) "")
)

