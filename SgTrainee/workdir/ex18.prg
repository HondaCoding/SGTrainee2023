clear
Set color to N/W

DO WHILE .t.
   nPrimeiro := 1
   nColuna := 01

   DO WHILE nPrimeiro <= 10
      @ 01,nColuna say nPrimeiro picture'99'
      nPrimeiro++
      nColuna += 3
   ENDDO


   InKey(0)

ENDDO