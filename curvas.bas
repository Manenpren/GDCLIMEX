Sub Main
Open "c:\lispmsa\ruta.prv" For Input As #1
Line Input #1,ruta$
Line Input #1,detall$
Line Input #1,si$
Line Input #1,frec$
Line Input #1,dit$
Line Input #1,dite$
Line Input #1,colort$
Line Input #1,tamt$
Line Input #1,sepc$
Line Input #1,metodo$
Line Input #1,bdatos$
Line Input #1,tog1$
Line Input #1,ints$
Line Input #1,inti$
Line Input #1,espr$
Line Input #1,dec$
Close #1
Set Surf = CreateObject("Surfer.App")
Surf.FileNew()
VTAMT = Val (tamt$)
VCOLORT = Val (colort$)
If si$ = "1" Then 
  opsi = 2 
Else
  opsi = 0
End If
SURF.DrawTextAttributes(,VTAMT,,,,"RED")
T = SURF.GridData(ruta$,0,1,2,,,,,Val(espr$),Val(espr$),,,Val(metodo$),"c:\lispmsa\NIVLOT.GRD",1)
'T = SURF.GRIDDATA(ruta$,0,1,2,,,,,val(espr$),,,,val(metodo$),"c:\lispmsa\NIVLOT.GRD",1,val(bdatos$))
If T = 1 Then T = SURF.MAPCONTOUR("c:\lispmsa\NIVLOT.GRD",opsi,,,Val (sepc$),,,2,,,,Val(detall$),,Val(FREC$),Val(DIT$),Val(DITE$))
If T = 1 Then T = SURF.FILEEXPORT("c:\lispmsa\NIVLOT.DXF",0,,)
Open "c:\lispmsa\TEMP.TMP" For Output As #1
Print #1, "S"
Close #1
SURF.FILEEXIT(2)
End Sub
