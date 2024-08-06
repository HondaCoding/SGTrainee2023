clear
/*--------- TABELA ----------*/

@ 05,01 to 07,79 //linha1 (06) CABE€ALHO
@ 09,01 to 11,79 //linha2 (08) & linha3 (10)
@ 13,01 to 15,79 //linha4 (12) & linha5 (14)
@ 05,01 to 15,79 //borda

@ 05,35 to 15,50 //coluna1 (xx,02 - xx,34) & coluna2 (xx,36 - xx,49)
@ 05,60 to 15,79 //coluna3 (xx,51 - xx,59) & coluna4 (xx,61 - xx,79)

@ 06,02 say "DESCRICAO DO PRODUTO"
@ 06,36 say "QUANTIDADE"
@ 06,51 say "VALOR"
@ 06,61 say "TOTAL"

/*------- VARIAVEIS --------*/
cNomeCliente  := space(30)
cNomeVendedor := space(30)

cNomeProdutoA := space(30)
cNomeProdutoB := space(30)
cNomeProdutoC := space(30)

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0
nQuantidadeTotal := 0

nValorProdutoA := 0
nValorProdutoB := 0
nValorProdutoC := 0

nTotalA := 0
nTotalB := 0
nTotalC := 0
nTotal  := 0

dAtual   := Date()
dVenda   := CToD('')
dEntrega := CToD('')

/*--------- DATA DE VENDA ---------*/
@ 20,15 say "DIGITE A DATA DA VENDA"

@ 04,18 GET dVenda
Read

@ 04,01 say "Data da Venda: " + DToC(dVenda)

@ 20,01 CLEAR to 20,80

/*--------- DATA DE ENTREGA ---------*/
@ 20,15 say "DIGITE A DATA DE ENTREGA"

@ 16,01 say "Data de Entrega: "

@ 20,40 GET dEntrega
Read

dEntrega := dEntrega +3

@ 16,01 say "Data de Entrega: " + DToC(dEntrega)

@ 20,01 CLEAR to 20,08

/*--------- NOME CLIENTE/VENDEDOR ---------*/
@ 20,15 say "DIGITE O NOME DO CLIENTE E DO VENDEDOR"

@ 21,15 say "Nome: "
@ 22,15 say "Vendedor"

@ 21,22 GET cNomeCliente picture"@!"
@ 22,24 GET cNomeVendedor picture"@!"
Read

@ 02,01 say "Nome:  " + AllTrim(cNomeCliente)
@ 03,01 say "Cliente:  " + AllTrim(cNomeVendedor)

@ 20,01 CLEAR to 22,80

/*--------- PRODUTO A ----------*/
@ 20,15 say "Digite o NOME, QUANTIDADE e VALOR DO PRODUTO A"

@ 08,02 GET cNomeProdutoA picture"@!"
@ 08,36 GET nQuantidadeA picture"999"
@ 08,51 GET nValorProdutoA picture"@E 9,999.99"
Read

nTotalA := nQuantidadeA * nValorProdutoA

@ 08,61 say nTotalA

@ 20,01 CLEAR to 20,80

/*-------- PRODUTO B ---------*/
@ 20,15 say "Digite o NOME, QUANTIDADE e VALOR DO PRODUTO B"

@ 10,02 GET cNomeProdutoB picture"@!"
@ 10,36 GET nQuantidadeB picture"999"
@ 10,51 GET nValorProdutoB picture"@E 9,999.99"
Read

nTotalB := nQuantidadeB * nValorProdutoB

@ 10,61 say nTotalB

@ 20,01 CLEAR to 20,80

/*-------- PRODUTO C ---------*/
@ 20,15 say "Digite o NOME, QUANTIDADE e VALOR DO PRODUTO C"

@ 12,02 GET cNomeProdutoC picture"@!"
@ 12,36 GET nQuantidadeC picture"999"
@ 12,51 GET nValorProdutoC picture"@E 9,999.99"
Read

nTotalC := nQuantidadeC * nValorProdutoC

@ 12,61 say nTotalC

@ 20,01 CLEAR to 20,80

/*---------- TOTAL ----------*/
nTotal := nTotalA + nTotalB + nTotalC
nQuantidadeTotal := nQuantidadeA + nQuantidadeB +nQuantidadeC

@ 14,02 say "Valor Total da Compra"
@ 14,36 say nQuantidadeTotal
@ 14,61 say nTotal








InKey(0)
clear
