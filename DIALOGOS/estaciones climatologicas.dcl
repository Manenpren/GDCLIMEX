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
           key = "eric";
           label = "Eric";
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
    : button {
              key = "regreasaatras";
              label = "Regresar a pantalla previa"; 
              fixed_width = true;
              fixed_height = true;
              alignment = right;
              is_cancel = false;
           }
}

EST3 : dialog {
    label = "Busqueda de estaciones climatologicas";
    : row {
     : column {
      : image_button {
         key          = "imagen2";
         width        = 103;
         height = 46 ;
         aspect_ratio = 1.0;
         color        = 256;
         allow_accept = false;
      }
      : row {
        label = "E";
        : button {
           key = "estab";
           label = "<"; 
           fixed_width = false;
           fixed_height = true;
           alignment = left;
           is_cancel = false;
        }
        : button {
           key = "estar";
           label = ">"; 
           fixed_width = false;
           fixed_height = true;
           alignment = right;
           is_cancel = false;
           width = 1;
        }
       : edit_box {
         label = "DISTANCIA DE BUSQUEDA EN METROS" ;
         key = "dbus" ;
         value = "20000" ;
         fixed_width = true;
         edit_width = 6 ;
       }
      }
     }
     : column {
         : column {
          : row {
            label = "CROQUIS DE MACROLOCALIZACIÓN DE LA BASE";
           : image_button {
              key          = "imagen";
              width        = 55;
              height = 21 ;
              aspect_ratio = 1.0;
              color        = 256;
              allow_accept = false;
           }
          }
          : column {
            label = "ESTACION BASE O ESTACION A LLENAR";
            : edit_box {
              label = "CLAVE DE LA ESTACIÓN" ;
              key = "CLEST" ;
              value = "16001" ;
              fixed_width = false;
              edit_width = 6 ;
            }
            : edit_box {
              label = "PORCENTAJE DE DATOS" ;
              key = "PDAT" ;
              value = "80.05%" ;
              fixed_width = false;
              edit_width = 6 ;
            }
            : edit_box {
              label = "RANGO DE AÑOS DE LOS DATOS" ;
              key = "RDAT" ;
              value = "ENE-1950 FEB-2013" ;
              fixed_width = false;
              edit_width = 20 ;
            }
            : edit_box {
              label = "DISTANCIA AL CENTROIDE DE LA CUENCA" ;
              key = "DISTC" ;
              value = "ENE-1950 FEB-2013" ;
              fixed_width = false;
              edit_width = 20 ;
            }
            : spacer { height = 0.1; }
          }
          : column {
            label = "ESTACION SELECCIONADA OPCIONES";
            : edit_box {
              label = "CLAVE DE LA ESTACIÓN" ;
              key = "CLESTF" ;
              value = "" ;
              fixed_width = false;
              edit_width = 6 ;
            }
            : edit_box {
              label = "PORCENTAJE DE DATOS" ;
              key = "PDATF" ;
              value = "" ;
              fixed_width = false;
              edit_width = 6 ;
            }
            : edit_box {
              label = "RANGO DE AÑOS DE LOS DATOS" ;
              key = "RDATF" ;
              value = "" ;
              fixed_width = false;
              edit_width = 20 ;
            }
            : edit_box {
              label = "DISTANCIA AL CENTROIDE DE LA CUENCA" ;
              key = "DISTCF" ;
              value = "" ;
              fixed_width = false;
              edit_width = 15 ;
            }
            : edit_box {
              label = "DISTANCIA A LA ESTACIÓN BASE" ;
              key = "DISTBF" ;
              value = "" ;
              fixed_width = false;
              edit_width = 15 ;
            }
            : edit_box {
              label = "CORRELACION LINEAL DE LOS DATOS" ;
              key = "CORRL" ;
              value = "" ;
              fixed_width = false;
              edit_width = 6 ;
            }
            : edit_box {
              label = "CORRELACION ESPACIAL DE ESTACIONES" ;
              key = "CORRE" ;
              value = "" ;
              fixed_width = false;
              edit_width = 6 ;
            }
            : spacer { height = 0.1; }
          }
          : toggle {
            key = "utlr";
            label = "ACTIVAR PARA METODO DE LA RELACION NORMALIZADA";
            alignment = left;
          }
          : toggle {
            key = "utlp";
            label = "ACTIVAR PARA METODO DE PROMEDIO ARITMETICO";
            alignment = left;
          }
          : toggle {
            key = "utlus";
            label = "ACTIVAR PARA METODO DE SERVICIO METEOROLOGICO U.S.A";
            alignment = left;
          }
         }
         fixed_height = true;
         alignment = centered;
      }
    }
    ok_cancel;
}
