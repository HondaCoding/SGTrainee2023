clear
@ 01,01 TO 11,79 // perimetro tabela & primeira linha
@ 03,01 TO 09,79 // segunda linha & quinta linha
@ 05,01 TO 07,79 // terceira linha & quarta linha

@ 01,22 TO 11,67 // coluna1 & coluna4
@ 01,34 TO 11,67 // coluna2 & coluna3

@ 04,03 say "A"
@ 06,03 say "B"
@ 08,03 say "C"

@ 02,02 say "Descricao do Produto" // 20
@ 02,23 say "Quantidade" //10
@ 02,36 say "Preco unitario" //14
@ 02,68 say "Valor Total" //11

nValorA := 0
nValorB := 0
nValorC := 0

nTotal := 0

nAquantidade := 0
nBquantidade := 0
nCquantidade := 0

cNomeCliente := Space(30)
cVendedor := Space(30)

/*------- GET CLIENTE --------*/
@ 15,01 say "Nome: "
@ 16,01 say "Vendedor"

@ 15,07 GET cNomeCliente Picture"@!"
@ 16,09 GET cVendedor Picture"@!"
Read

@ 12,01 say "Cliente: " + AllTrim(cNomeCliente)
@ 13,01 say "Vendedor: " + AllTrim(cVendedor)

/*-------- PRODUTO A --------*/  //abaixei 10linhas, comecava na 12
@ 15,01 clear TO 16,80
@ 17,01 say "Digite a quantidade do produto A: "

@ 17,35 GET nAquantidade Picture "999"
Read

@ 18,01 say "Digite o VALOR do produto A: "

@ 18,30 GET nValorA Picture "@E 9,999.99"
Read

nATotal := nValorA * nAquantidade

@ 04,23 say nAquantidade
@ 04,36 say nValorA
@ 04,62 say nATotal

/*------- PRODUTO B ---------*/
@ 19,01 say "Digite a quantidade do produto B: "

@ 19,35 GET nBquantidade Picture"999"
Read

@ 20,01 say "Digite o VALOR do produto B: "

@ 20,30 GET nValorB Picture "@E 9,999.99"
Read

nBTotal := nValorB * nBquantidade

@ 06,23 say nBquantidade
@ 06,36 say nValorB
@ 06,62 say nBTotal

/*------ PRODUTO C ---------*/
@ 21,01 say "Digite a quantidade do produto C: "

@ 21,35 GET nCquantidade Picture"999"
Read

@ 22,01 say "Digite o VALOR do produto: "

@ 22,30 GET nValorC Picture"@E 9,999.99"
Read

nCTotal := nValorC * nCquantidade

@ 08,23 say nCquantidade
@ 08,36 say nValorC
@ 08,62 say nCTotal

/*------- VALOR TOTAL --------*/
nTotal := nATotal + nBTotal + nCTotal

@ 10,68 say nTotal Picture"@E 9,999.99"

InKey(0)
