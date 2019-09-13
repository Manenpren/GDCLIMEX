rep : dialog {
 label = "GENERA REPORTE FINAL DE ESTACIONES"; 	
: column {

    : radio_row {   
      label = "Datos generales"; 

          : radio_button {
          label = "Incluir datos generales";
           key = "Incdata";
           } 
          : toggle {
          label = "Incluir correlacion";
           key = "inccorre";
           } 

}

: radio_row{   
      label = "Dato climatico"; 
 : popup_list {
       key = "DATOCLI";
       mnemonic = "R";
       list = "Evaporacion\nGranizo\nPrecipitacion\nNeblina\nCobertura de cielo\nTormentas electricas\nTemperatura\nTemperatura minima\nTemperatura maxima";
       edit_width = 30;
       fixed_width = true;
       alling=center;
     }
}
: spacer { 
  height = 1; 
}

: radio_row {   
      label = "Dato fuente";
      key = "DATFUE";
: radio_button {
    label = "Anual"; 
    key = "ANUAL";
  }
   
: radio_button {
    label = "Mensual"; 
    key = "MENSUAL";
  } 

: radio_button {
    label = "Diaria"; 
    key = "STE";
  }

}

: radio_row {   
      label = "Tipo de proceso";
      key = "DATIP";
   : radio_button {
    label = "Maximos"; 
    key = "MAXIMOS";
  }
   
: radio_button {
    label = "Medios"; 
    key = "MEDIOS";
  } 

: radio_button {
    label = "Minimos"; 
    key = "MINIMOS";
  }

: radio_button {
    label = "Totales"; 
    key = "TOTALES";
  }   

  : radio_button {
    label = "Vacios"; 
    key = "VCIOS";
  }   

}

}
     ok_cancel;
}
