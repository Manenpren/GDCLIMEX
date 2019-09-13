(DEFUN TRFCOR2 (BDCOOR XMARCO YMARCO XGMINTRC YGMINTRC XGMAXTRC YGMAXTRC pxini pyini anchox anchoy)
  (SETQ DRy (/ (ABS (- YGMINTRC YGMAXTRC)) YMARCO))
  (SETQ DRx (/ (ABS (- XGMINTRC XGMAXTRC)) XMARCO))
  (SETQ CONTINT 0)
  (SETQ CONTvert 0)
  (SETQ VERTINT (list (atoi (substr BDCOOR (1+ (* contvert (+ anchox anchoy))) anchox)) (atof (substr BDCOOR (1+ (+ (* contvert (+ anchox anchoy)) anchox)) anchoy))))
  (SETQ CONTVERT varini)
  (SETQ matrizDIB NIL)
  (setq xvert 0)
  (repeat ndatgrf
     (SETQ XVERT (CAR VERTINT))
     (SETQ YVERT (CADR VERTINT))
     (SETQ XVERT (+ pxini (/ (ABS (- XVERT XGMINTRC)) DRx)))
     (SETQ YVERT (+ pyini (/ (ABS (- YGMAXTRC YVERT)) DRy)))
     (SETQ PUNTOCX (LIST XVERT YVERT))
     (setq CONCATENADO (cons CONTVERT puntoCx))
     (setq matrizDIB (append matrizDIB (list CONCATENADO)))
     (SETQ VERTINT (list (atoi (substr BDCOOR (1+ (* contvert (+ anchox anchoy))) anchox)) (atof (substr BDCOOR (1+ (+ (* contvert (+ anchox anchoy)) anchox)) anchoy))))
     (SETQ CONTVERT (1+ CONTVERT))
  );repeat
  (SETQ MATRIZDIB MATRIZDIB)
)
