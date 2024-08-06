// Pedro Honda
Set EPOCH TO 1940
Set Date Brit
Set scoreboard off
Set wrap on
clear

/*----------banco de dados-----------*/
nCodigoBanana       := 3588
cDescricaoBanana    := "Banana Prata"
nPrecoBanana        := 2.50
nDescontoMaxBanana  := 16
nEstoqueBanana      := 140

nCodigoPera       := 4577
cDescricaoPera    := "Pera Argentina"
nPrecoPera        := 7.00
nDescontoMaxPera  := 12
nEstoquePera      := 120.50

nCodigoBatata       := 7066
cDescricaoBatata    := "Batata Peruana"
nPrecoBatata        := 11.00
nDescontoMaxBatata  := 03
nEstoqueBatata      := 865

nCodigoAbacate       := 6099
cDescricaoAbacate    := "Abacate Negro"
nPrecoAbacate        := 10.99
nDescontoMaxAbacate  := 09
nEstoqueAbacate      := 250.00
/*-----------------------------------*/

cLogin           := "ADMIN"
cSenha           := "123"
dAtual           := Date()
cData            := DtoC(dAtual)
nNumeroDePedidosContador := 1

@ 00,01 say PadC("***FRUTARIA DO PEDRO***",77)
@ 00,71 say cData
@ 01,01 to 22,79 double
do while .t.
   cLoginDigitado := space(5)
   cSenhaDigitado := space(3)
   
   Set color to N/W
   @ 02,02 clear to 21,78
   @ 02,02 say PadC("TELA DE LOGIN",77) color("B/W")
   @ 04,02 say "Digite o login..:"
   @ 05,02 say "Digite a Senha..:"

   @ 04,19 get cLoginDigitado picture'@!' valid !Empty(cLoginDigitado)
   @ 05,19 get cSenhaDigitado picture'@!' valid !Empty(cSenhaDigitado)
   Read
   If LastKey() == 27
      nOpcaoSair := Alert("Deseja Sair?",{'SIM','NAO'},"W/R")
      if nOpcaoSair == 1
         exit
      else
         loop
      endif
      exit
   endif

   if cLoginDigitado == cLoginDigitado .and. cSenhaDigitado == cSenha
      Alert("Login realizado com sucesso!",,"W/B") // linha2: nome da tela, linha3: comeca o conteudo
      do while .t.
         Set color to W/BG+
         @ 02,02 clear to 21,78
         @ 02,02 say PadC("MENU",77)
        
         @ 04,02 prompt PadC("EFETUAR PEDIDOS",77)
         @ 05,02 prompt PadC("SAIR",77)
         Menu to nOpcao
         if nOpcao == 1
            @ 02,02 clear to 21,78
            nNumeroDoPedido     := nNumeroDePedidosContador
            nTotalDoPedido      := 0
            nSomaDeTodosPedidos := 0

            cCliente        := space(50)
            cNomeCliente    := space(30)
            nLimiteCredito  := 0
            dPedido         := CtoD('')    
            nLinha          := 05

            @ 02,02 say PadC("SOLICITAR DADOS DA VENDA",77)
            @ 03,04 say "PEDIDO NUMERO 00" + AllTrim(Str(nNumeroDoPedido)) color("R/W")
            @ 05,02 say "Nome do cliente...: "
            @ 06,02 say "Limite de credito.: "
            @ 07,02 say "Data do pedido....: "

            @ 05,22 get cNomeCliente   picture'@!'           valid !Empty(cLoginDigitado)
            @ 06,22 get nLimiteCredito picture'@E 999.99'    valid !Empty(nLimiteCredito)
            @ 07,22 get dPedido                              valid dPedido == dAtual
            Read
            If LastKey() == 27
               nOpcaoSair := Alert("Deseja Sair?",{'SIM','NAO, CONTINUAR..'},"W/R")
               if nOpcaoSair == 1
                  exit
               else
                  loop
               endif
               exit
            endif

            @ 08,02 say PadC("Dados da Venda registrados com sucesso!!",77)
            @ 09,02 say PadC("pressione qualquer tecla para continuar.",77)
            Inkey(0)
            
            @ 04,02 clear to 21,78
            @ 02,02 say PadC("PRODUTOS VENDIDOS",77) color ("G/BG+")
            @ 04,02 say "Codigo   |   Descricao      | Qtde. |  Preco Unit. | % Desc.|Valor Total"  // 74espacos 
            //           02 - 09 !     11   -   29    ! 31-37    39  -  53   ! 55-63    65 - 76
            do while .t.
               nCodigoDigitado     := 0
               cDescricaoProduto   := ""
               nQuantidadeDigitado := 0
               nPrecoUnitProduto   := 0
               nDescontoDigitado   := 999
               nValorTotal         := 0
               nVerificarDesconto  := 0

               @ nLinha,02 get nCodigoDigitado     picture'9999'  valid !Empty(nCodigoDigitado)
               @ nLinha,33 get nQuantidadeDigitado picture'999'   valid !Empty(nQuantidadeDigitado)
               Read
               if LastKey() == 27
                  nOpcao := Alert("Selecione",{'FINALIZAR COMPRA','CANCELAR COMPRA','CONTINUAR'},)
                  if nOpcao == 1
                     nSomaDeTodosPedidos += nTotalDoPedido
                     exit
                  endif
                  if nOpcao == 2
                     nNumeroDePedidosContador--
                     exit
                  endif
                  if nOpcao == 3
                     loop
                  endif
               endif

               /*verificacao de qual produto é por meio do codigo*/
               if nCodigoDigitado == nCodigoBanana
                  cDescricaoProduto  := cDescricaoBanana
                  nVerificarDesconto := nDescontoMaxBanana
                  nPrecoUnitProduto  := nPrecoBanana
               elseif nCodigoDigitado == nCodigoPera
                  cDescricaoProduto  := cDescricaoPera
                  nVerificarDesconto := nDescontoMaxPera
                  nPrecoUnitProduto  := nPrecoPera
               elseif nCodigoDigitado == nCodigoBatata
                  cDescricaoProduto  := cDescricaoBatata
                  nVerificarDesconto := nDescontoMaxBatata
                  nPrecoUnitProduto  := nPrecoBatata
               elseif nCodigoDigitado == nCodigoAbacate
                  cDescricaoProduto  := cDescricaoAbacate
                  nVerificarDesconto := nDescontoMaxAbacate
                  nPrecoUnitProduto  := nPrecoAbacate
               endif
      
               do while nDescontoDigitado >= nVerificarDesconto
                  @ nLinha,56 get nDescontoDigitado   picture'99'
                  Read
                  if LastKey() == 27
                     nOpcao := Alert("Selecione",{'FINALIZAR COMPRA','CANCELAR COMPRA','CONTINUAR'},)
                     if nOpcao == 1
                        nSomaDeTodosPedidos += nTotalDoPedido
                        exit
                     endif
                     if nOpcao == 2
                        nNumeroDePedidosContador--
                        exit
                     endif
                     if nOpcao == 3
                        loop
                     endif
                  endif
                  if nDescontoDigitado >= nVerificarDesconto
                  Alert("Valor de desconto digitado maior que o Maximo Permitido, por favor digite um valor menor.")
                  endif
                  if nDescontoDigitado <= nVerificarDesconto
                     exit
                  endif
               enddo

               /*calculos*/
               nValorTotal    := (nQuantidadeDigitado * nPrecoUnitProduto)
               nDesconto      := nValorTotal*(nDescontoDigitado/100)
               nValorTotal    -= nDesconto
               nTotalDoPedido += nValorTotal

               /*print para apresentar dados do produto*/
               @ nLinha,11 say cDescricaoProduto
               @ nLinha,41 say Str(nPrecoUnitProduto)
               @ nLinha,67 say "R$ " + AllTrim(Str(nValorTotal))

               if nLinha >=21
                  nLinha := 05
                  @ 05,02 clear to 21,78
                  loop
               endif
               nLinha++
               Inkey(0)
            enddo
         else
            exit
         endif
      enddo
   else
      Alert("Usuario ou senha incorretos, digite novamente",,"W/R")
      Alert("dica, login: ADMIN  |   senha: 123",,"W/B")
      loop
   endif
enddo
