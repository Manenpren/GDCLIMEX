(defun cadpoli (bdpoligonal)
  (SETQ E (assoc 0 bdpoligonal))
  (setq cont 1)
  (SETQ matrizcad NIL)
  (WHILE E
    ()
    (SETQ E (assoc cont bdpoligonal))
    (SETQ CONT (1+ CONT))
  );WHILE
  (setq matrizpol matrizpol)
);(setq x (trpol (car (entsel))))