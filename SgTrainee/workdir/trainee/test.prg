Set EPOCH TO 1940
Set Date Brit
clear

cNomeCliente  := space(30)
cNomeVendedor := space(30)
dAtual        := Date()
dVenda       := CToD('')
dEntrega      := CToD('')

cNomeProduto1 := space(30)
cNomeProduto2 := space(30)
cNomeProduto3 := space(30)

nQuantidadeProduto1 := 0
nQuantidadeProduto2 := 0
nQuantidadeProduto3 := 0
nQuantidadeTotal    := 0

nValorProduto1 := 0
nValorProduto2 := 0
nValorProduto3 := 0

nDescontoProduto1 := 0
nDescontoProduto2 := 0
nDescontoProduto3 := 0
nDescontoTotal := 0

nTotalProduto1 := 0
nTotalProduto2 := 0
nTotalProduto3 := 0
nTotalCompra   := 0

/*----------- VARIAVEIS DA POSICAO DA TABELA -----------*/
nPosicaoTabela := 06

nLinha1 := nPosicaoTabela
nLinha2 := nLinha1 + 02
nLinha3 := nLinha2 + 02
nLinha4 := nLinha3 + 02
nLinha5 := nLinha4 + 02
nLinha6 := nLinha5 + 02

nCabecalho     := nPosicaoTabela + 01
nPrimeiroCampo := nCabecalho + 02
nSegundoCampo  := nPrimeiroCampo + 02
nTerceiroCampo := nSegundoCampo + 02
nQuartoCampo   := nTerceiroCampo + 02


/*Cada C‚dula/Campo ter  a respectiva linha:
  CABE€ALHO = nPosicaoTabela + 1
  PRIMEIRO E DEMAIS CAMPOS = CABE€ALHO + 2*/

/*---------------- GET CLIENTE/VENDEDOR/DATAS ---------------------*/
@ 07,15 say "----- Digite o NOME do CLIENTE ----"

@ 08,25 GET cNomeCliente picture"@!" valid !Empty(cNomeCliente)
Read

@ 10,15 say "----- Digite o NOME do VENDEDOR ----"

@ 11,25 GET cNomeVendedor picture"@!" valid !Empty(cNomeVendedor)
Read

@ 13,15 say "----- Digite a DATA DA VENDA ----"

@ 14,25 GET dVenda valid dVenda <= dAtual .and. !Empty(dVenda)
Read

@ 16,15 say "----- Digite a DATA DE ENTREGA ----"

@ 17,25 GET dEntrega valid dEntrega >= (dVenda + 3)
Read

clear

/*---------------------- GET PRODUTO 1 --------------------------*/
@ 07,15 say "----- Informe a DESCRI€Aå do PRODUTO 1 ----"

@ 08,25 GET cNomeProduto1 picture"@!"
Read

@ 10,15 say "----- Informe a QUANTIDADE do PRODUTO 1 ----"

@ 11,25 GET nQuantidadeProduto1 picture"999"
Read

@ 13,15 say "----- Informe o VALOR do PRODUTO 1 ----"

@ 14,25 GET nValorProduto1 picture"@E 9,999.99"
Read

@ 16,15 say "----- Informe a % de DESCONTO -----"

@ 17,25 GET nDescontoProduto1 picture"999"
Read

nTotalProduto1 := (nQuantidadeProduto1 * nValorProduto1)

nDescontoProduto1 := (nDescontoProduto1/100) * nTotalProduto1

nTotalProduto1 := nTotalProduto1 - nDescontoProduto1

@ 17,15 say "*********** PRODUTO 1 REGISTRADO COM SUCESSO! ***********"
@ 18,26 say "Pressione qualquer tecla para prosseguir"
InKey(0)

clear

*---------------------- GET PRODUTO 2 --------------------------*/
@ 07,15 say "----- Informe a DESCRI€Aå do PRODUTO 2 ----"

@ 08,25 GET cNomeProduto2 picture"@!"
Read

@ 10,15 say "----- Informe a QUANTIDADE do PRODUTO 2 ----"

@ 11,25 GET nQuantidadeProduto2 picture"999"
Read

@ 13,15 say "----- Informe o VALOR do PRODUTO 2 ----"

@ 14,25 GET nValorProduto2 picture"@E 9,999.99"
Read

nTotalProduto2 := nQuantidadeProduto2 * nValorProduto2

@ 17,15 say "*********** PRODUTO 2 REGISTRADO COM SUCESSO! ***********"
@ 18,26 say "Aperte qualquer tecla para prosseguir"
InKey(0)

clear

*---------------------- GET PRODUTO 3 --------------------------*/
@ 07,15 say "----- Informe a DESCRI€Aå do PRODUTO 3 ----"

@ 08,25 GET cNomeProduto3 picture"@!"
Read

@ 10,15 say "----- Informe a QUANTIDADE do PRODUTO 3 ----"

@ 11,25 GET nQuantidadeProduto3 picture"999"
Read

@ 13,15 say "----- Informe o VALOR do PRODUTO 3 ----"

@ 14,25 GET nValorProduto3 picture"@E 9,999.99"
Read

nTotalProduto3 := nQuantidadeProduto3 * nValorProduto3

@ 17,15 say "*********** PRODUTO 3 REGISTRADO COM SUCESSO! ***********"
@ 18,26 say "Aperte qualquer tecla para prosseguir"
InKey(0)

clear

/*------------------ IMPRESSAO DO COMPROVANTE ------------------*/
/*
@ 01,01 TO 03,79 // LINHAS
@ 03,01 TO 05,79
@ 05,01 TO 07,79
@ 07,01 TO 09,79
@ 09,01 TO 11,79

@ 01,01 TO 11,35 // COLUNAS
@ 01,46 TO 11,62
*/

/*
@ 02,02 say "DESCRICAO DO PRODUTO"
@ 02,36 say "QUANTIDADE"
@ 02,47 say "PRECO"
@ 02,63 say "TOTAL"

@ 04,02 say cNomeProduto1
@ 04,36 say nQuantidadeProduto1
@ 04,47 say nValorProduto1
@ 04,63 say nTotalProduto1

@ 06,02 say cNomeProduto2
@ 06,36 say nQuantidadeProduto2
@ 06,47 say nValorProduto2
@ 06,63 say nTotalProduto2

@ 08,02 say cNomeProduto3
@ 08,36 say nQuantidadeProduto3
@ 08,47 say nValorProduto3
@ 08,63 say nTotalProduto3

@ 10,02 say "Valor Total da Compra"
@ 10,36 say nQuantidadeTotal
@ 10,63 say nTotalCompra
*/





@ 01,01 TO nLinha6,79
@ 02,02 say "Nome do CLIENTE: " + cNomeCliente
@ 03,02 say "Nome do VENDEDOR: " + cNomeVendedor
@ 04,02 say "Data da VENDA: " + DToC(dVenda)
@ 05,02 say "Data de ENTREGA: " + DToC(dEntrega)

@ nLinha1,01 TO nLinha2,79 // LINHAS
@ nLinha2,01 TO nLinha3,79
@ nLinha3,01 TO nLinha4,79
@ nLinha4,01 TO nLinha5,79
@ nLinha5,01 TO nLinha6,79

@ nLinha1,01 TO nLinha6,25 // COLUNAS   coluna1(02-24) coluna2(26-34)
@ nLinha1,01 TO nLinha6,35 //           coluna3(36-45)
@ nLinha1,46 TO nLinha6,62 //           coluna4(47-61) coluna5(63-78)


@ nCabecalho,02 say "DESCRICAO DO PRODUTO"
@ nCabecalho,26 say "QUANTIDADE"
@ nCabecalho,36 say "VALOR"
@ nCabecalho,47 say "DESCONTO"
@ nCabecalho,63 say "TOTAL"

@ nPrimeiroCampo,02 say cNomeProduto1
@ nPrimeiroCampo,26 say nQuantidadeProduto1
@ nPrimeiroCampo,36 say nValorProduto1
@ nPrimeiroCampo,47 say Transform(nDescontoProduto1,"999") + "%"
@ nPrimeiroCampo,63 say nTotalProduto1

@ nSegundoCampo,02 say cNomeProduto2
@ nSegundoCampo,26 say nQuantidadeProduto2
@ nSegundoCampo,36 say nValorProduto2
@ nSegundoCampo,47 say nDescontoProduto2
@ nSegundoCampo,63 say nTotalProduto2

@ nTerceiroCampo,02 say cNomeProduto3
@ nTerceiroCampo,26 say nQuantidadeProduto3
@ nTerceiroCampo,36 say nValorProduto3
@ nTerceiroCampo,47 say nDescontoProduto3
@ nTerceiroCampo,63 say nTotalProduto3

@ nQuartoCampo,02 say "Valor TOTAL da compra"
@ nQuartoCampo,26 say nQuantidadeTotal
@ nQuartoCampo,47 say nDescontoTotal
@ nQuartoCampo,63 say nTotalCompra

InKey(0)
clear

/*
1 |--------------------------------------------------------------------| Linha1
2 |CABECALHO      (34)            | (10) |     (15)    |    (15)       |
3 |--------------------------------------------------------------------- Linha2
4 |CAMPO1   (3)        |    |        |           |
5 |--------------------------------------------------------------------- Linha3
6 |CAMPO2           |    |        |           |
7 |--------------------------------------------------------------------- Linha4
8 |CAMPO3           |    |        |           |
9 |--------------------------------------------------------------------- Linha5
10|CAMPO4           |    |        |           |
11|--------------------------------------------------------------------| Linha6

Cabecalho: 1-3
PrimeirooCampo: 3-5
SegundoCampo: 5-7
TerceiroCampo: 7-9
QuartoCampo: 9-11
*/
