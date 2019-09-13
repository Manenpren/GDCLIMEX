(defun C:1 ()
  (COMMAND "LAYER" "OFF" "RETICULA" "")
)

(defun C:2 ()
  (COMMAND "LAYER" "ON" "RETICULA" "")
)

(defun C:3 ()
  (COMMAND "LAYER" "OFF" "gslayer" "")
)

(defun C:4 ()
  (COMMAND "LAYER" "ON" "gslayer" "")
)

(defun C:6 ()
  (COMMAND "LAYER" "ON" "cvl_secp" "")
)

(defun C:5 ()
  (COMMAND "LAYER" "Off" "cvl_secp" "")
)

(defun C:6 ()
  (COMMAND "LAYER" "Off" "PR" "")
  (COMMAND "LAYER" "on" "terreno N" "")
)

(defun C:Q ()
  (COMMAND "LAYER" "ON" "*" "")
)

(defun C:Q ()
  (COMMAND "LAYER" "ON" "*" "")
)