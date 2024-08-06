clear
nPrimeiro := 0
nSegundo  := 0

@ 01,01 say "Digite 1: "
@ 02,01 say "Digite 2: "

@ 01,11 GET nPrimeiro picture"999"
@ 02,11 GET nSegundo picture"99"
Read

nSoma := nPrimeiro + nSegundo
nSubt := nPrimeiro - nSegundo
nDiv  := nPrimeiro / nSegundo
nMult := nPrimeiro * nSegundo

@ 03,01 say Replicate("-",14)
@ 04,01 say "Resultado da Soma: " + AllTrim(Str(nSoma))
@ 05,01 say "Resultado da Subtracao: " + AllTrim(Str(nSubt))
@ 06,01 say "Resultado da Divisao: " + AllTrim(Str(nDiv))
@ 07,01 say "Resultado da Multiplicacao: " + AllTrim(Str(nMult))
