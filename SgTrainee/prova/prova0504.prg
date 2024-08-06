//Pedro Honda
Set scoreboard off
clear
cTexto1 := PadC("RESTAURANTE - SG SISTEMAS",75)
cTexto2 := PadC("MENU",75)

do while .t.
   nLinha                                  := 12
   nQuantidadeAtendimentosMesa01           := 0
   nQuantidadeAtendimentosMesa02           := 0
   nQuantidadeAtendimentosGeral            := 0
   nValorTotalContaAbertaMesa01            := 0
   nValorTotalContaAbertaMesa02            := 0
   nValorTotalMesa01                       := 0
   nValorTotalMesa02                       := 0
   nValorTotalGeral                        := 0
   nValorTotalAtendimentosCanceladosMesa01 := 0
   nValorTotalAtendimentosCanceladosMesa02 := 0
   nValorTotalAtendimentosCanceladosGeral  := 0
   nTicketMedioMesa01                      := 0
   nTicketMedioMesa02                      := 0
   nTicketMedioGeral                       := 0
   nValorReceberFuncionario01              := 0
   nValorReceberFuncionario02              := 0
   nValorReceberFuncionarioGeral           := 0
   nMesa01 := 0
   nMesa02 := 0

   @ 03,01 to 05,79 double
   @ 01,01 to 22,79 double
   @ 02,02 say cTexto1
   @ 04,02 say cTexto2

   @ 06,02 prompt PadC("MESAS",76)     message 'gerenciar mesas'
   @ 07,02 prompt PadC("RELATORIO",76) message 'ver relatorio'
   @ 08,02 prompt PadC("SAIR", 76)     message 'fechar programa'
   Menu to nOpcao
   if nOpcao == 1/*----------------------------------- MESAS ------------------------------*/
      do while .t.
         nMesas            := 0
         cAtendente        := space(1)
         cFormaDePagamento := space(1)
         nValorRecebido    := 0

         @ 06,02 clear to 21,78
         @ 06,03 say "Mesa.....: "
         @ 07,03 say "Atendente: "
         if Empty(nMesa01)
            @ 06,16 say "01" color ("N/G")
         else
            @ 06,16 say "01" color ("N/R")
         endif
         if Empty(nMesa02)
            @ 06,20 say "02" color ("N/G")
         else
            @ 06,20 say "02" color ("N/R")
         endif
         
         @ 06,14 get nMesas     picture'9'            valid !Empty(nMesas)
         @ 07,14 get cAtendente picture'9' valid cAtendente$"12"
         Read
         if LastKey() == 27
            nOpcao := Alert("Deseja voltar ao menu principal?",{'Sim','Nao'},"N/W")
            if nOpcao == 1
               exit
            else
               Alert(Str(nValorTotalMesa01)) //TESTEE!!!!!
               Alert(Str(nQuantidadeAtendimentosMesa01)) //TESTEE!!!!!
               
               loop
            endif
         endif

         if nMesas == 1 .and. Empty(nMesa01) .and. !Empty(cAtendente) // caso a mesa esteja vazia   
            nTotal             := 0
            nProdutos          := 0

            @ 08,01 to 10,79 double
            @ 01,01 to 22,79 double
            @ 09,03 say PadC("PEDIDO",76)
            @ 11,09 say "PRODUTO" // 01~22 
            @ 11,23 say "|QTD|"   // 25~26
            @ 11,27 say "|PREC. UNIT|"  // 32~38 
            @ 11,45 say "VALOR"
            
            do while .t.
               cProduto           := space(22)
               nQuantidadeProduto := 0
               nPrecoUnitProduto  := 0
               nValor             := 0
               @ nLinha,02 get cProduto           picture'@!'        valid !Empty(cProduto)
               @ nLinha,25 get nQuantidadeProduto picture'99'        valid !Empty(cProduto)
               @ nLinha,32 get nPrecoUnitProduto  picture'@E 999.99'  valid !Empty(cProduto)
               Read

               if Lastkey() == 27
                  nOpcao := Alert("Deseja?",{'Enviar pedido para producao','Continuar digitando','Abandonar digitacao'},"N/W")
                  
                  if nOpcao == 1
                     nMesa01 := 1
                     nQuantidadeAtendimentosMesa01++
                     nValorTotalContaAbertaMesa01 += nTotal
                     Alert("Pedido enviado para poducao.",,"N/W")
                     @ 06,02 clear to 07,78
                     exit
                  endif

                  if nOpcao == 2
                     loop
                  endif
                  
                  if nOpcao == 3
                     @ 08,02 clear to 21,78
                     exit
                  endif
               endif

               if nProdutos == 8
                  @ 21,03 say "Dados cadastrados com sucesso!"
                  @ 22,03 say "Pressione alguma tecla para continuar"
                  Inkey(0)
               endif

               nValor := nQuantidadeProduto * nPrecoUnitProduto
               nTotal += nValor
               @ nLinha,39 say nTotal color("W/N")

               nProdutos++
               nLinha++ 
            enddo
            loop
         endif

         if nMesas == 1 .and. !Empty(nMesa01) .and. !Empty(cAtendente) // caso a mesa esteja ocupada 
            nOpcao := Alert("Deseja?",{'Digitar outra mesa','Faturar atendimento','Cancelar atendimento'},"N/W")
            if nOpcao == 1
               loop
            endif

            if nOpcao == 2
               do while .t.
                  @ 08,01 to 10,79 double
                  @ 01,01 to 22,79 double
                  @ 09,03 say PadC("FATURAMENTO",76)

                  nOpcao := Alert("Aceita taxa de servico?",{'Sim','Nao'},"N/W")
                  if nOpcao == 1
                     nValorTotalContaAbertaMesa01 += (nTotal * 0.10)
                  endif
                  
                  @ 11,02 say "[D]inheiro / [C]artao / Che[Q]ue:"
                  @ 12,02 say "Total a pagar...................:" + Transform(nValorTotalContaAbertaMesa01,"@E 9,999.99")
                  @ 13,02 say "Valor recebido..................:"

                  @ 11,35 get cFormaDePagamento  picture'@!'          valid cFormaDePagamento$"DCQ"
                  @ 13,35 get nValorRecebido     picture'@E 9,999.99' valid !Empty(nValorRecebido)
                  Read
                  if Lastkey() == 27
                     nOpcao := Alert("Deseja?",{'Cancelar pagamento','Recomecar pagamento'},"N/W")
                     if nOpcao == 1
                        loop
                     endif
                     if nOpcao == 2
                        loop
                     endif
                  endif

                  if nValorRecebido < nValorTotalContaAbertaMesa01
                     Alert("Valor recebido menor do que o valor total a pagar. tente novamente!",,)
                     loop
                  endif
                  
                  if nValorRecebido == nValorTotalContaAbertaMesa01
                     @ 16,02 say "Pagamento efetuado com sucesso!"
                     @ 17,02 say "Pressione alguma tecla para continuar"
                     nMesa01 := 0
                     Inkey(0)
                     exit
                  endif

                  if nValorRecebido > nValorTotalContaAbertaMesa01
                     nValorTroco := nValorTotalContaAbertaMesa01 - nValorRecebido
                     @ 14,02 say "Valor troco.....................:" + Str(nValorTroco)
                     @ 16,02 say "Pagamento efetuado com sucesso!"
                     @ 17,02 say "Pressione alguma tecla para continuar"
                     nMesa01 := 0
                     Inkey(0)
                     exit
                  endif
               enddo
            endif

            if nOpcao == 3
               nValorTotalAtendimentosCanceladosMesa01++
               Alert("Atendimento/pedido cancelado com sucesso.",,"N/W")
               nMesa01 := 0
            endif
         endif

















      enddo
   endif
   if nOpcao == 2

   endif
   if nOpcao == 3
      exit
   endif
enddo