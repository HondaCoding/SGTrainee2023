// Pedro Honda
Set EPOCH TO 1940
Set Date Brit
Set scoreboard off
Set wrap on
clear
/* ------------ EMBARCACOES ------------
 01,01 nLinha == 1 .and. nColuna == 1       
 01,05 nLinha == 1 .and. nColuna == 5
 03,06 nLinha == 3 .and. nColuna == 6
 04,02 nLinha == 4 .and. nColuna == 2
 05,05 nLinha == 5 .and. nColuna == 5
 06,03 nLinha == 6 .and. nColuna == 3
 */
@ 00,00 to 22,78 double
@ 02,01 to 02,77 double
@ 01,01 say PadC("DESCOBERTA NAVAL",77)
@ 03,05 say "JOGADA"
@ 04,01 to 04,17 double
@ 07,01 to 07,17 double
@ 09,01 to 09,17 double
@ 03,17 to 21,17 double
@ 08,05 say "JOGADAS"

// tamanho do bloco: 3x9      total: 18linhas x 54colunas
nTamanhoDeLinhas      := 03
nTamanhoDeColunas     := 09
nQuantidadeDeCampos   := 06
nPontoFinalLinha      := nQuantidadeDeCampos * nTamanhoDeLinhas  // 18
nPontoFinalColuna     := nQuantidadeDeCampos * nTamanhoDeColunas // 54
nPontoInicialLinha    := 06
nPontoInicialColuna   := 20

@ nPontoInicialLinha,nPontoInicialColuna clear to nPontoFinalLinha,nPontoFinalColuna 


do while .t.
   Set color to
   nTentativasTotal      := 20
   nTentativasRealizadas := 0
   nTentativasRestantes  := nTentativasTotal
   nAcertos              := 0
   nErros                := 0
   nEmbarcacao1Verify    := 0
   nEmbarcacao2Verify    := 0
   nEmbarcacao3Verify    := 0
   nEmbarcacao4Verify    := 0
   nEmbarcacao5Verify    := 0
   nEmbarcacao6Verify    := 0
   nEmbarcacoesAfundadas := 0

   @ 05,01 say "LINHA.....: "
   @ 06,01 say "COLUNA....: "
   @ 10,01 say "RESTANTE..: "
   @ 11,01 say "REALIZADAS: "
   @ 12,01 say "ACERTOS...: "
   @ 13,01 say "ERROS.....: "
   Set color to ("W/B")
   @ 10,30 clear to 15,35  
    
   do while nTentativasRealizadas <= nTentativasTotal
      if nTentativasRealizadas == 20
         Alert("Voce PERDEU! KKKKKKKKKK Tentativas restantes nao sao suficientes para desvendar todas as embarcacoes")
         nOpcao := Alert("Selecione uma opcao",{'Iniciar novo jogo','Sair'})
         if nOpcao == 1
            exit
         else
            exit
         endif
      endif
      if nEmbarcacoesAfundadas == 6
         Alert("Voce GANHOU. Parabens!")
         nOpcao := Alert("Selecione uma opcao",{'Iniciar novo jogo','Sair'})
         if nOpcao == 1
            exit
         else
            exit
         endif
      endif

      nLinhaDigitada        := 0
      nColunaDigitada       := 0
      nTentativasRestantes := nTentativasTotal - nTentativasRealizadas

      Set color to
      @ 10,13 clear to 10,15 // area do campo naval
      @ 10,13 say AllTrim(Str(nTentativasRestantes))
      @ 11,14 say AllTrim(Str(nTentativasRealizadas))
      @ 12,14 say AllTrim(Str(nAcertos))
      @ 13,14 say AllTrim(Str(nErros))
      Set color to ("W/B")

      @ 05,13 get nLinhaDigitada  picture'9' valid nLinhaDigitada > 0
      @ 06,13 get nColunaDigitada picture'9' valid nLinhaDigitada > 0
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
     
      nTentativasRealizadas++

      if nLinhaDigitada == 1 .and. nColunaDigitada == 1 // embarcacao 1
         if nEmbarcacao1Verify == 1
            Alert("Embarcacao ja encontrada")
            loop
         endif
         Alert("Encontrou!")
         Set color to ("W/R")
         @ 10,30 clear to 10,30
         Set color to ("W/B")
         nAcertos += 1
         nEmbarcacao1Verify := 1
         nEmbarcacoesAfundadas += 1
      elseif nLinhaDigitada == 1 .and. nColunaDigitada == 5 // embarcacao 2
         if nEmbarcacao2Verify == 1
            Alert("Embarcacao ja encontrada")
            loop
         endif
         Alert("Encontrou!")
         Set color to ("W/R")
         @ 10,34 clear to 10,34
         Set color to ("W/B")
         nAcertos += 1
         nEmbarcacao2Verify := 1
         nEmbarcacoesAfundadas += 1
      elseif nLinhaDigitada == 3 .and. nColunaDigitada == 6 // embarcacao 3
         if nEmbarcacao3Verify == 1
            Alert("Embarcacao ja encontrada")
            loop
         endif
         Alert("Encontrou!")
         Set color to ("W/R")
         @ 12,35 clear to 12,35
         Set color to ("W/B")
         nAcertos += 1
         nEmbarcacao3Verify := 1
         nEmbarcacoesAfundadas += 1
      elseif nLinhaDigitada == 4 .and. nColunaDigitada == 2 // embarcacao 4
         if nEmbarcacao4Verify == 1
            Alert("Embarcacao ja encontrada")
            loop
         endif
         Alert("Encontrou!")
         Set color to ("W/R")
         @ 13,31 clear to 13,31
         Set color to ("W/B")
         nAcertos += 1
         nEmbarcacao4Verify := 1
         nEmbarcacoesAfundadas += 1
      elseif nLinhaDigitada == 5 .and. nColunaDigitada == 5 // embarcacao 5
         if nEmbarcacao5Verify == 1
            Alert("Embarcacao ja encontrada")
            loop
         endif
         Alert("Encontrou!")
         Set color to ("W/R")
         @ 14,34 clear to 14,34
         Set color to ("W/B")
         nAcertos += 1
         nEmbarcacao5Verify := 1
         nEmbarcacoesAfundadas += 1
      elseif nLinhaDigitada == 6 .and. nColunaDigitada == 3 // embarcacao 6
         if nEmbarcacao6Verify == 1
            Alert("Embarcacao ja encontrada")
            loop
         endif
         Alert("Encontrou!")
         Set color to ("W/R")
         @ 15,32 clear to 15,32
         Set color to ("W/B")
         nAcertos += 1
         nEmbarcacao6Verify := 1
         nEmbarcacoesAfundadas += 1
      else      
         nLinhaDigitadaFinal  = nLinhaDigitada + 9
         nColunaDigitadaFinal = nColunaDigitada + 29
         Set color to ("W/W")
         @ nLinhaDigitadaFinal,nColunaDigitadaFinal clear to nLinhaDigitadaFinal,nColunaDigitadaFinal
         Alert("Errou")
         Set color to ("W/B")
         nErros += 1
      endif
   enddo
   if nOpcao == 1
      loop
   else
      exit
   endif
enddo

/* TESTE PARA DEIXAR O TAMANHO DO CAMPO NAVAL, TAMANHO DAS BOX AUTOMATICAS..(*nao finalizado)

tamanho do bloco: 3x9      total: 18linhas x 54colunas
 ------------ EMBARCACOES ------------
 01,01 nLinha == 1 .and. nColuna == 1       
 01,05 nLinha == 1 .and. nColuna == 5
 03,06 nLinha == 3 .and. nColuna == 6
 04,02 nLinha == 4 .and. nColuna == 2
 05,05 nLinha == 5 .and. nColuna == 5
 06,03 nLinha == 6 .and. nColuna == 3
 
nTamanhoDeLinhas      := 03
nTamanhoDeColunas     := 09
nQuantidadeDeCampos   := 06
nPontoFinalLinha      := nQuantidadeDeCampos * nTamanhoDeLinhas  // 18
nPontoFinalColuna     := nQuantidadeDeCampos * nTamanhoDeColunas // 54
nPontoInicialLinha    := 06 // 6-1 pois a primeira linha ja conta
nPontoInicialColuna   := 20 // 20-1 pois a primeira linha ja conta

nLinha1 := 0
nLinha2 := 1
nLinha3 := 2
nLinha4 := 3
nLinha5 := 4
nLinha6 := 5

nColuna1 := 1
nColuna2 := 2
nColuna3 := 3
nColuna4 := 4
nColuna5 := 5
nColuna6 := 6


Set color to ("W/B")
@ (nPontoInicialLinha+1),(nPontoInicialColuna+1) clear to (nPontoFinalLinha+nPontoInicialLinha),(nPontoFinalColuna+nPontoInicialColuna)
Inkey(0)

Set color to ("W/R")// vermelho
@ (nPontoInicialLinha),(1+nPontoInicialColuna) clear to (nPontoInicialLinha+nTamanhoDeLinhas),(nPontoInicialColuna+nTamanhoDeColunas)
Inkey(0)
//Set color to ("W/G")// verde
//Alert(Str(nPontoInicialColuna))
//@ (nPontoInicialLinha),(6+nPontoInicialColuna) clear to (nPontoInicialLinha+nTamanhoDeLinhas),(5+nPontoInicialColuna+nTamanhoDeColunas)
//Inkey(0)
Set color to ("W/W")// branco
@ ((nLinha3*nTamanhoDeLinhas)+nPontoInicialLinha),((nColuna6*nTamanhoDeColunas)+nPontoInicialColuna) clear to ((nLinha3*nTamanhoDeLinhas)+nPontoInicialLinha+nTamanhoDeLinhas),((nColuna6*nTamanhoDeColunas)+nPontoInicialColuna+nTamanhoDeColunas)
Inkey(0)

*/
