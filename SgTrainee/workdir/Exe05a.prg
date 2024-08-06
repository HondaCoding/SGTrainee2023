clear
nA := 0
nB := 0

@ 01,01 say "Informe o valor de A = "
@ 02,01 say "Informe o valor de B = "

@ 01,24 GET nA picture "99"
@ 02,24 GET nB picture "9,999.99"
@ 03,24 GET nB picture "@E 9,999.99"
Read

nAtroca:= nB
nBtroca:= nA

nA := nAtroca
nB := nBtroca

@ 01,01 to 04,25

@ 02,02 say "Valor de A trocado = " + AllTrim(Str(nA))
@ 03,02 say "Valor de B trocado = " + AllTrim(Str(nB))

InKey(0)
