
clear

nNumero1:=0
nNumero2:=0
nnumero3:=0
cResposta:=(100)

set color to W/B
@01,01 clear to 04,34

@01,01 say "digite tres numeros"
@02,01 say "primeiro"
@02,12 say "segundo"
@02,22 say "terceiro"
@02,09 get nNumero1 picture "@E 999"
@02,19 get nNumero2 picture "@E 999"
@02,30 get nNumero3 picture "@E 999"
read

if nNumero1=nNumero2 .and. nNumero1=nNumero3
   cResposta="Todos os numero sao iguais"
elseif nNumero1>nNumero2 .and. nNumero1>nNumero3
   cResposta="O maior numero ‚ o primeiro"
elseif nNumero2>nNumero1 .and. nNumero2>nNumero3
   cResposta="O maior numero ‚ o segundo"
elseif nNumero3>nNumero1 .and. nNumero3>nNumero2
   cResposta="O maior numero ‚ o terceiro"
elseif nNumero1==nNumero2
   cResposta="O maior numero ‚ o primeiro e o segundo"
elseif nNumero2==nNumero3
   cResposta="O maior numero ‚ o segundo e o terceiro"
elseif nNumero1==nNumero3
   cResposta="O maior numero ‚ o primeiro e o terceiro"
endif

@04,01 say cResposta

@07,01 say " "
