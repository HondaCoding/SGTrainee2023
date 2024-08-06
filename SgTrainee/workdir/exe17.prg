clear

cTexto:=Space(15)
nContador:=0

@01,01 say "Digite seu nome:"
@01,17 get cTexto picture "@!" valid !empty(cTexto)
read

cTexto:=alltrim(cTexto)
nTamanhoTexto:=len(cTexto)
nTamanhoTexto2:=nTamanhoTexto

do while nContador<nTamanhoTexto
   cTextoInverso:=substr(cTexto,nTamanhoTexto2,1)
   nTamanhoTexto2--
   nContador++

   @02,nContador say cTextoInverso

enddo


