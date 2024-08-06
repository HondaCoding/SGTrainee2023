clear
nPrimeiro := 0
nSegundo  := 0

INPUT "Informe o primeiro numero: " TO nPrimeiro
INPUT "Informe o segundo numero: "  TO nSegundo

nSoma := nPrimeiro + nSegundo
nSub  := nPrimeiro - nSegundo
nDiv  := nPrimeiro / nSegundo
nMult := nPrimeiro * nSegundo

clear
@ 01,01 say "Aperte uma tecla para visualizar o resultado"
InKey(0)

clear
@ 01,01 TO 07,45
@ 02,02 say "Numeros Informados: " + AllTrim(Str(nPrimeiro)) + ", " + AllTrim(Str(nSegundo))
@ 03,02 say "Resultado da soma: " + AllTrim(Str(nSoma))
@ 04,02 say "Resultado da subtracao: " + AllTrim(Str(nSub))
@ 05,02 say "Resultado da divisao: " + AllTrim(Str(nDiv))
@ 06,02 say "Resultado da multiplicacao: " + AllTrim(Str(nMult))
InKey(0)
