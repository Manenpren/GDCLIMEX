principal : dialog {
    label = "Recopila datos";
     : popup_list {
       label = "Estado";
       key = "estado";
       mnemonic = "R";
       list = "01-Aguascalientes\n02-Baja California\n03-Baja California Sur\n04-Campeche\n05-Coahuila de Zaragoza\n06-Colima\n07-Chiapas\n08-Chihuahua\n09-Distrito Federal\n10-Durango\n11-Guanajuato\n12-Guerrero\n13-Hidalgo\n14-Jalisco\n15-México\n16-Michoacán de Ocampo\n17-Morelos\n18-Nayarit\n19-Nuevo León\n20-Oaxaca\n21-Puebla\n22-Querétaro\n23-Quintana Roo\n24-San Luis Potosí\n25-Sinaloa\n26-Sonora\n27-Tabasco\n28-Tamaulipas\n29-Tlaxcala\n30-Veracruz de Ignacio de la Llave\n31-Yucatán\n32-Zacatecas";
       edit_width = 30;
       fixed_width = true;
     }
     : popup_list {
       label = "Municipio";
       key = "muni";
       mnemonic = "R";
       list = "";
       edit_width = 30;
       fixed_width = true;
     }
     : text { label = "14"; key = "zonax"; alignment = left; }
     : edit_box {
       label = "Zona horaria" ;
       key = "zona" ;
       value = "" ;
       edit_width = 5 ;
     } 
     ok_cancel;
}
