do while .t.

   clear

   cNome:=Space(30)

   nQuantidade:=0

   nLinha:=3

   nVezes=0

   nColunas:=1
   @01,01 say "quantas vezes vocˆ quer quer imprimir o seu nome?"

   @02,01 get cNome       picture "@!"  valid !empty(cNome)
   @03,01 get nQuantidade picture "9999999999999999"  valid !empty(nQuantidade)
   read

   if LastKey()== 27
      exit
   endif

   do while nVezes < nQuantidade
      nVezes++
      nLinha++
      @nLinha,nColunas say alltrim(str(nVezes))+":"+cNome



      if  nLinha>22
         nColunas:=nColunas+10
         nLinha:=nLinha-21
         nLinha++
         nVezes++
      endif
   enddo

   Inkey(0)

enddo
