(defun c:encrip ()
  (setq ArcH (open "d:\\lispmsa\\dir2.txt" "r"))
  (SETQ LIN (READ-LINE ARCH)) 
  (WHILE (/= LIN "") 
    (IF (/= LIN "")
      (PROGN
     ;   (print (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" (substr lin (- (strlen lin) 8) 5) "Ga4TykP8G5Umo9Ye513"))
        (dos_encrypt (strcat ruta lin) (strcat "4avEjsD8Gl�Opwrpfvc3071fdA" (substr lin (- (strlen lin) 8) 5) "Ga4TykP8G5Umo9Ye513"))
      )
    )
    (SETQ LIN (READ-LINE ARCH))
  )
  (CLOSE ARCH)
)