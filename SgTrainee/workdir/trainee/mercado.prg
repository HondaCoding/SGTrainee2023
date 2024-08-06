Set EPOCH TO 1940
Set Date Brit
Set scoreboard off
clear

/*---------------------------------------- DATA ---------------------------------------------*/

dAtual     := Date()
nDiaSemana := DoW(dAtual)
nMes       := Month(dAtual)

IF nDiaSemana == 1
   cDiaSemana := "Domingo"
ELSEIF nDiaSemana == 2
   cDiaSemana := "Segunda"
ELSEIF nDiaSemana == 3
   cDiaSemana := "Terca"
ELSEIF nDiaSemana == 4
   cDiaSemana := "Quarta"
ELSEIF nDiaSemana == 5
   cDiaSemana := "Quinta"
ELSEIF nDiaSemana == 6
   cDiaSemana := "Sexta"
ELSEIF nDiaSemana == 7
   cDiaSemana := "Sabado"
ENDIF

IF nMes == 1
   cMes := "Janeiro"
ELSEIF nMes == 2
   cMes := "Fevereiro"
ELSEIF nMes == 3
   cMes := "Marco"
ELSEIF nMes == 4
   cMes := "Abril"
ELSEIF nMes == 5
   cMes := "Maio"
ELSEIF nMes == 6
   cMes := "Junho"
ELSEIF nMes == 7
   cMes := "Julho"
ELSEIF nMes == 8
   cMes := "Agosto"
ELSEIF nMes == 9
   cMes := "Setembro"
ELSEIF nMes == 10
   cMes := "Outubro"
ELSEIF nMes == 11
   cMes := "Novembro"
ELSEIF nMes == 12
   cMes := "Dezembro"
ENDIF

@ 23,22 say "Maringa, " + AllTrim(Str(Day(dAtual))) + " de " + cMes + " de " + AllTrim(Str(Year(dAtual))) + " - " + cDiaSemana

/*------------------------------- DADOS CLIENTE/VENDA -------------------------------------*/
DO WHILE .t.
   DO WHILE .t.
      cNomeCliente     := space(25)
      cNomeVendedor    := space(24)
      dAtual           := Date()
      dVenda           := CToD('')
      dEntrega         := CToD('')
      nTotalCompra     := 0
      nTotalQuantidade := 0

      nLinhaProduto    := 06

      @ 01,01 to 22,79 double                   // contorno da tela toda
      @ 01,32 say " MERCADINHO "

      @ 02,02 say "NOME CLIENTE: "              // (14)
      @ 03,02 say "NOME VENDEDOR: "             // (15)
      @ 04,02 say "DATA DA VENDA: "             // (15)
      @ 04,30 say "DATA DE ENTREGA: "           // (17)
      @ 05,01 to 22,79 double                   // contorno inferior dos dados do CLIENTE/VENDA

      @ 01,45 to 03,79 double                                  // contorno TOTAL DA COMPRA
      @ 02,46 say "TOTAL DA COMPRA: " color("B/W")             // (17)   valor entra na coluna 02,63

      @ 02,16 get cNomeCliente  picture"@!" valid !Empty(cNomeCliente)
      @ 03,17 get cNomeVendedor picture"@!" valid !Empty(cNomeVendedor)
      @ 04,17 get dVenda                    valid dVenda <= dAtual .and. !Empty(dVenda)
      @ 04,47 get dEntrega                  valid dEntrega >= dVenda
      Read

      IF LastKey() == 27
         nOpcao := Alert("Deseja sair?",{'SIM','NAO'})
         IF nOpcao == 2
            clear
            loop
         ELSE
            exit
         ENDIF
      ENDIF

      nOpcao := Alert("Deseja prosseguir para os produtos?", {'SIM','NAO'},"W/G")
      IF nOpcao == 2
         loop
      ELSE
         Alert("CLIENTE E VENDA REGISTRADOS COM SUCESSO!",,"N/G")
         exit
      ENDIF
   ENDDO

/*-------------------------------------- PRODUTOS ------------------------------------------*/
   DO WHILE nLinhaProduto <= 20
                                      // cabecalho linha 06 & produtos linha 08
                                      // [02~30] 31 [32~44] 45 [46~57] 58 [59~78]
      cNomeProduto       := space(20)
      nQuantidadeProduto := 0
      nValorProduto      := 0
      nTotalProduto      := 0

      @ 05,01 to 07,79 double          // contorno do cabecalho
      @ 06,08 say "NOME DO PRODUTO"    // (15)
      @ 06,33 say "QUANTIDADE"         // (10)
      @ 06,48 say "VALOR"              // (5)
      @ 06,66 say "TOTAL"              // (5)

      nLinhaProduto+=2

      @ nLinhaProduto,03 get cNomeProduto       picture"@!"
      @ nLinhaProduto,36 get nQuantidadeProduto picture "999"         valid !Empty(nQuantidadeProduto)
      @ nLinhaProduto,47 get nValorProduto      picture "@E 9,999.99" valid !Empty(nValorProduto)
      Read

      IF LastKey() == 27
         nOpcao := Alert("Deseja sair?",{'SIM','NAO'})
         IF nOpcao == 2
            nTotalCompra := 0
            clear
            loop
         ELSE
            exit
         ENDIF
      ENDIF

      @ nLinhaProduto-1,01 to nLinhaProduto+1,31 double     // cedula nome
      @ nLinhaProduto-1,31 to nLinhaProduto+1,45 double     // cedula quantidade
      @ nLinhaProduto-1,45 to nLinhaProduto+1,58 double     // cedula valor
      @ nLinhaProduto-1,58 to nLinhaProduto+1,79 double     // cedula total

      nTotalProduto := nQuantidadeProduto * nValorProduto   //calculo do total e impressao em seguida
      @ nLinhaProduto,59 say nTotalProduto

      nTotalCompra += nTotalProduto
      @ 02,63 say nTotalCompra color("B/W")

      nTotalQuantidade += nQuantidadeProduto
     // @ xx,xx say AllTrim(nTotalQuantidade)

      IF nLinhaProduto >= 20
         nOpcaoLimite := Alert("Limite de produtos atingido, por favor selecione uma opcao",{'PAGAMENTO','CANCELAR'})
         IF nOpcaoLimite == 2
            @ 06,02 clear to 21,78
            @ 02,63 clear to 02,78
            nLinhaProduto := 06
            nTotalCompra  := 0
            loop
         ELSE
            exit
         ENDIF
      ENDIF

      nOpcao := Alert("Selecione uma opcao:", {'PAGAMENTO','CANCELAR','CONTINUAR'},"W/B")
      IF nOpcao == 3
         loop
      ENDIF
      IF nOpcao == 2
         @ 06,02 clear to 21,78
         @ 02,63 clear to 02,78
         nLinhaProduto := 06
         nTotalCompra  := 0
         loop
      ENDIF
      IF nOpcao == 1
         exit
      ENDIF
   ENDDO

   IF nOpcao == 2
      clear
      loop
   ENDIF
   IF nOpcao == 1
      exit
   ENDIF
ENDDO

/*-------------------------------------- PAGAMENTO ------------------------------------------*/
nOpcao := Alert("SELECIONE A FORMA DE PAGAMENTO", {'CARTAO','DINHEIRO'},"W/G")
IF nOpcao == 1
   @ 04,57 say "PAGAMENTO: CARTAO" color("G/W")
   Alert("[CARTAO]  VALOR TOTAL DA COMPRA: " + Str(nTotalCompra) + "        QUANTIDADE DE PRODUTOS: " + Str(nTotalQuantidade),,"W/G")
ELSE
   @ 04,57 say "PAGAMENTO: CARTAO" color("G/W")
   Alert("[DINHEIRO]  VALOR TOTAL DA COMPRA: " + Str(nTotalCompra) + "          QUANTIDADE DE PRODUTOS: " + Str(nTotalQuantidade),,"W/G")
ENDIF

InKey(0)
clear
