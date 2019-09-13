Sub Main
'open "c:\ruta.dll" for input as #1
'line input #1,ruta$
'close #1
Set Surf = CreateObject("Surfer.App")
Surf.FileNew()
Open "C:\LISPMSA\GRD.GRI" For Input As #1
Line Input #1, LIN$
Close #1
SURF.GridSlice(LIN$,"C:\LISPMSA\PERF.BLN",,"C:\LISPMSA\PERF.DAT",)
r% = Shell("c:\lispmsa\SEPARA.EXE",1)
SURF.FILEEXIT(2)
End Sub
