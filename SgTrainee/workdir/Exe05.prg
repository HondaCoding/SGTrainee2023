clear
nA := 0
nB := 0

INPUT "Informe o valor de A = " TO nA
INPUT "Informe o valor de B = " TO nB

nAtroca:= nB
nBtroca:= nA

nAfinal := nAtroca
nBfinal := nBtroca

@ 01,01 to 09,45
@ 02,02 say "Valor de A informado ="
@ 02,24 say nA
@ 03,02 say "Valor de B informado ="
@ 03,24 say nB
@ 04,02 say "Valor de A trocado = "
@ 04,23 say nAfinal
@ 05,02 say "Valor de B trocado = "
@ 05,23 say nBfinal
@ 06,02 say Replicate("_",43)
@ 07,02 say "Valor de A convertido em string = " + AllTrim(Str(nAtroca))
@ 08,02 say "Valor de B convertido em string = " + AllTrim(Str(nBtroca))

InKey(0)
