(defun rangosest ()
   (fill_image 90 340 500 30 252)
   (fill_image 90 323 500 30 252)
   (fill_image 90 328 500 5 103)
   (fill_image 90 346 500 5 103)
   (setq slidexx "BTNGRF(GRF)")
;   (slide_image 0 0 761 381 (STRCAT RUTA "SLIDES\\" slidexx ".SLD")) 
   (stexto "INTERVALO 1" "romans" 12 20 325)
   (stexto "INTERVALO 2" "romans" 12 20 342)
   ;(slide_image ral1 78 800 260 (STRCAT RUTA "SLIDES\\" "linea1" ".SLD"));-242
   ;(slide_image ral2 78 800 260 (STRCAT RUTA "SLIDES\\" "linea1" ".SLD"));70
   ;(slide_image rbl1 78 800 280 (STRCAT RUTA "SLIDES\\" "linear2" ".SLD"));-7
   ;(slide_image rbl2 78 800 280 (STRCAT RUTA "SLIDES\\" "linear2" ".SLD"));192
   (slide_image ranga1 292 40 45 (STRCAT RUTA "SLIDES\\" "flechas1" ".SLD"));88
   (slide_image ranga2 292 40 45 (STRCAT RUTA "SLIDES\\" "flechas1" ".SLD"));400
   (slide_image rangb1 309 40 45 (STRCAT RUTA "SLIDES\\" "flechas2" ".SLD"));350
   (slide_image rangb2 309 40 45 (STRCAT RUTA "SLIDES\\" "flechas2" ".SLD"));550
   (setq borantx1 ral1)
   (setq borantx2 ral2)
   (setq borantx3 rbl1)
   (setq borantx4 rbl2)
)
   
