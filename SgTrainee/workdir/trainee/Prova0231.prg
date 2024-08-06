// Pedro Honda
Set EPOCH TO 1940
Set Date Brit
Set scoreboard off
clear

DO WHILE .t.
   DO WHILE .t.
      dAtual                         := Date()
      nNumeroEmpregadosAnalisados    := 0
      nContador                      := 1

      nHomens                        := 0
      nMulheres                      := 0
      nHomensAposentados             := 0
      nMulheresAposentadas           := 0
      nPercentualHomensAposentados   := 0
      nPercentualMulheresAposentadas := 0
      nQuantidadeHomensIdadeSuperior := 0
      nQuantidadeMulheresAdmitidas   := 0
      nQuantidadeHomensDemitidos     := 0
      nTotalRemuneracaoHomens        := 0
      nTotalRemuneracaoMulheres      := 0

      /*--------------------------- GET -----------------------------------------*/
      @ 01,01 say "Digite o numero de empregados analisados: "

      @ 01,44 GET nNumeroEmpregadosAnalisados picture"99"
      Read

      DO WHILE nContador <= nNumeroEmpregadosAnalisados

         cNomeColaborador           := space(30)
         cSexoColaborador           := space(1)
         dNascimento                := CToD('')
         dAdmissao                  := CToD('')
         dDemissao                  := CToD('')
         nSalarioBase               := 0
         nSalarioBasePosAdicional   := 0
         nSalarioBasePosRemuneracao := 0
         nAdicionalNoturno          := 0
         nAdicionalInsalubridade    := 0

         @ 03,01 say "Nome: "                            // (6)
         @ 04,01 say "Sexo: "                            // (6)
         @ 05,01 say "Data de Nascimento: "              // (21)
         @ 06,01 say "Data de Admissao: "                // (19)
         @ 07,01 say "Data de Demissao: "                // (19)
         @ 08,01 say "Salario base: "                    // (15)
         @ 09,01 say "Adicional Noturno: "               // (20)
         @ 10,01 say "Adicional Insalubridade: "         // (27)

         nContador += 1

         @ 03,06 GET cNomeColaborador        picture"@!"         valid !Empty(cNomeColaborador)
         @ 04,06 GET cSexoColaborador        picture"@!"         valid cSexoColaborador$'MF'
         @ 05,21 GET dNascimento                                 valid !Empty(dNascimento)
         @ 06,19 GET dAdmissao                                   valid !Empty(dAdmissao)
         @ 07,19 GET dDemissao                                   valid !Empty(dDemissao)
         @ 08,15 GET nSalarioBase            picture"@E 9,999.99" valid nSalarioBase > 0
         @ 09,20 GET nAdicionalNoturno       picture"999"        valid nAdicionalNoturno >= 0
         @ 10,27 GET nAdicionalInsalubridade picture"999"        valid nAdicionalInsalubridade >= 0
         Read

         IF LastKey() == 27
            nOpcao := Alert("Selecione uma opcao", {'CANCELAR','RETORNAR','PROCESSAR'})
            IF nOpcao == 1
               exit
            ENDIF
            IF nOpcao == 2
               loop
            ENDIF
            IF nOpcao == 3
               exit
            ENDIF
         ENDIF


         /*---------- CALCULOS ---------------------------------------------------*/
         nAdicionalNoturno        := nSalarioBase * (nAdicionalNoturno/100)
         nAdicionalInsalubridade  := nSalarioBase * (nAdicionalInsalubridade/100)

         nSalarioBasePosAdicional := nSalarioBase + nAdicionalNoturno + nAdicionalInsalubridade

         nRemuneracaoAdicional    := nSalarioBase * 0.08
         nRemuneracaoReducao      := nSalarioBase * 0.03

         dIdade         := (dAtual - dNascimento)/365
         dTempoTrabalho := dDemissao - dAdmissao

         /*---------- RECEBER APOSENTADORIA -------------------------------------*/
         IF cSexoColaborador == 'M'      //homem
            nHomens += 1
            IF dIdade >= 65 .and. dTempoTrabalho >= 30
               nHomensAposentados += 1
            ENDIF
         ENDIF

         IF cSexoColaborador == 'F'      //mulher
            nMulheres += 1
            IF dIdade >= 60 .and. dTempoTrabalho >= 25
               nMulheresAposentadas += 1
            ENDIF
         ENDIF


         /*---------- QUANTIDADE HOMENS IDADE SUPERIOR 80 ANOS ------------------*/
         IF cSexoColaborador == 'M'
            IF dIdade > 80
               nQuantidadeHomensIdadeSuperior += 1
            ENDIF
         ENDIF

         /*---------- QUANTIDADE MULHERES ADMITIDAS ANTES DE 2003 ---------------*/
         IF cSexoColaborador == 'F'
            IF Year(dAdmissao) < 2003
               nQuantidadeMulheresAdmitidas += 1
            ENDIF
         ENDIF

         /*---------- QUANTIDADE HOMENS DEMITIDOS NO ANO DE 2015 ----------------*/
         IF cSexoColaborador == 'M'
            IF Year(dDemissao) == 2015
               nQuantidadeHomensDemitidos += 1
            ENDIF
         ENDIF

         /*----------------- REMUNERACAO APOSENTADORIA --------------------------*/
         IF Year(dAdmissao) == 2005 .or. Year(dAdmissao) == 2009
            nSalarioBasePosRemuneracao := nSalarioBasePosAdicional + nRemuneracaoAdicional
         ENDIF
         IF Year(dAdmissao) == 2012 .or. Year(dAdmissao) == 2013
            nSalarioBasePosRemuneracao := nSalarioBasePosAdicional - nRemuneracaoReducao
         ENDIF

         IF cSexoColaborador == 'M'
            nTotalRemuneracaoHomens += nSalarioBasePosAdicional + nSalarioBasePosRemuneracao
         ENDIF
         IF cSexoColaborador == 'F'
            nTotalRemuneracaoMulheres += nSalarioBasePosAdicional + nSalarioBasePosRemuneracao
         ENDIF

      ENDDO
      nOpcao := Alert("Selecione uma opcao", {'CANCELAR','PROCESSAR'})
      IF nOpcao == 1
         loop
      ENDIF
      IF nOpcao == 2
         exit
      ENDIF
   ENDDO

   /*----------------- IMPRESSAO DOS RESULTADOS -------------------------------*/
   nPercentualHomensAposentados   := (nHomensAposentados * 100) / nHomens
   nPercentualMulheresAposentadas := (nMulheresAposentadas * 100) / nMulheres

   @ 01,01 to 23,80 double
   @ 01,32 say " CONTROLE INSS "
   @ 02,02 say "Percentual de Homens aposentados: " + AllTrim(Str(nPercentualHomensAposentados)) + "%"
   @ 03,02 say "Valor Total da Remuneracao dos Homens: " + "R$" + AllTrim(Str(nTotalRemuneracaoHomens))
   @ 04,02 say "Percentual de Mulheres aposentadas: " + AllTrim(Str(nPercentualMulheresAposentadas)) + "%"
   @ 05,02 say "Valor Total da Remuneracao das Mulheres: " + "R$" + AllTrim(Str(nTotalRemuneracaoMulheres))
   @ 06,02 say "Quantidade de homens com idade superior a 80 anos: " + AllTrim(Str(nQuantidadeHomensIdadeSuperior))
   @ 07,02 say "Quantidade de mulheres admitidas antes do ano de 2003: " + AllTrim(Str(nQuantidadeMulheresAdmitidas))
   @ 08,02 say "Quantidade de homens emitidos no ano de 2015: " + AllTrim(Str(nQuantidadeHomensDemitidos))

ENDDO
