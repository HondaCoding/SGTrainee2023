clear
nPrimeiro := 0
nSegundo  := 0

@ 01,01 say "Digite o primeiro numero: "
@ 02,01 say "Digite o segundo numero: "

@ 01,27 GET nPrimeiro picture"99"
@ 02,26 GET nSegundo picture"99"
Read

nProduto := nPrimeiro * nSegundo

@ 03,01 say "O produto dos dois valore eh: " + AllTrim(Str(nProduto))

