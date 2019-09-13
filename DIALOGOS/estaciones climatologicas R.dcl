EST : dialog {
    label = "Busqueda de estaciones climatologicas";
    : row {
      : image_button {
         key          = "imagen";
         width        = 153;
         height = 48 ;
         aspect_ratio = 1.0;
         color        = 256;
         allow_accept = false;
      }
      : column {
         : column {
           label = "Z";
         : image_button {
            key          = "mas1";
            width        = 2;
            height = 1 ;
            aspect_ratio = 1.0;
            color        = 7;
            allow_accept = false;
            fixed_height = true;
            fixed_width = true;
            alignment = centered;
         }
         : image_button {
            key          = "rzoom";
            width        = 4;
            height = 2 ;
            aspect_ratio = 1.0;
            color        = 7;
            allow_accept = false;
            fixed_height = true;
            fixed_width = true;
            alignment = centered;
         }
         : image_button {
            key          = "menos1";
            width        = 2;
            height = 1 ;
            aspect_ratio = 1.0;
            color        = 7;
            allow_accept = false;
            fixed_height = true;
            fixed_width = true;
            alignment = centered;
         }
         }
    : spacer { height = 1; }
         : column {
           label = "E";
           : button {
              key = "estar";
              label = ">"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
              width = 1;
           }
           : button {
              key = "estab";
              label = "<"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
           }
         }
         fixed_height = true;
         alignment = centered;
      }
    }
    : row {
       : row {
         label = "BD activas";
         : toggle {
           key = "clicom";
           label = "Clicom";
           alignment = left;
         }
         : toggle {
           key = "erick";
           label = "Erick";
           alignment = left;
         }
       }
    : spacer { height = 0.001; }
    : row {
      : spacer { width = 2; }
       : column {
         : image_button {
            key          = "mas";
            width        = 2;
            height = 1 ;
            aspect_ratio = 1.0;
            color        = 7;
            allow_accept = false;
            fixed_width = true;
         }
         : image_button {
            key          = "menos";
            width        = 2;
            height = 1 ;
            aspect_ratio = 1.0;
            color        = 7;
            allow_accept = false;
            fixed_width = true;
         }
       }
       : edit_box {
         label = "Distancia de busqueda (metros):" ;
         key = "dbus" ;
         value = "20000" ;
         fixed_width = true;
         edit_width = 6 ;
       }
       fixed_width = true;
       alignment = centered;
    }
    : spacer { height = 0.001; }
      : button {
          key = "siguiente";
          label = "Terminar seleccion"; 
          fixed_width = true;
          alignment = right;
          is_cancel = false;
      }
      : button {
          key = "buscaest";
          label = "Busca estaciones"; 
          fixed_width = true;
          alignment = right;
          is_cancel = false;
      }
    }
    ok_cancel;
}

EST2 : dialog {
    label = "Busqueda de estaciones climatologicas";
    : row {
      : image_button {
         key          = "imagen";
         width        = 153;
         height = 48 ;
         aspect_ratio = 1.0;
         color        = 256;
         allow_accept = false;
      }
      : column {
     : spacer { height = 1; }
         : column {
           label = "E";
           : button {
              key = "estar";
              label = ">"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
              width = 1;
           }
           : button {
              key = "estab";
              label = "<"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
           }
         }
         fixed_height = true;
         alignment = centered;
      }
    }
    ok_cancel;
}


EST3 : dialog {
    label = "OPCIONES DE BUSQUEDA DE PUNTOS LLENADO";
    : row {
      : image_button {
         key          = "imagen";
         width        = 153;
         height = 48 ;
         aspect_ratio = 1.0;
         color        = 256;
         allow_accept = false;
      }
      : column {
     : spacer { height = 1; }
         : column {
           label = "E";
           : button {
              key = "estar";
              label = ">"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
              width = 1;
           }
           : button {
              key = "estab";
              label = "<"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
           }
         }
         fixed_height = true;
         alignment = centered;
      }
    }
    ok_cancel;
}
