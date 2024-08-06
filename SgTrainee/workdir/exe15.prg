clear

cNome:=Space(30)

nContador:=1

@01,01 say "digite seu nome:"

@01,18 get cNome picture "@!" valid !empty(cNome)
read

do while nContador <11
   @02 ,01 say cNome
   nContador++
enddo

