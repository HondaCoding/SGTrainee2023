Set EPOCH TO 1940
Set Date Brit
Set scoreboard off
Set color to N/W
clear

DO WHILE .t.
	nQuantidadeDiaMes := 0

	cNome := space(30)
	dAtual := Date()
	dNascimento := CToD('')

	dDiaNascimento       := Day(dNascimento)
	dMesNascimento       := Month(dNascimento)
	dAnoNascimento       := Year(dNascimento)
	dDiaSemanaNascimento := DoW(dNascimento)
	cDiaSemanaNascimento := ""
	cMes := ""
	cIdade := ""

	dDiaAtual := Day(dAtual)
	dMesAtual := Month(dAtual)
	dAnoAtual := Year(dAtual)

	@ 02,02 say "Digite o nome................:" // 30 -> 32
	@ 03,02 say "Digite a data de nascimento..:"

	@ 02,32 GET cNome picture"@!" valid !Empty(cNome)
	@ 03,32 GET dNascimento valid !Empty(dNascimento)
	Read

	IF LastKey == 27
		exit
	ENDIF

	/*--------------------------------------- MASCARAS ---------------------------------------------*/
	//  --MESES--
	IF dMesNascimento == 1
		cMes := "Janeiro"
	ENDIF
	IF dMesNascimento == 2
		cMes := "Fevereiro"
	ENDIF
	IF dMesNascimento == 3
		cMes := "Marco"
	ENDIF
	IF dMesNascimento == 4
		cMes := "Abril"
	ENDIF
	IF dMesNascimento == 5
		cMes := "Maio"
	ENDIF
	IF dMesNascimento == 6
		cMes := "Junho"
	ENDIF
	IF dMesNascimento == 7
		cMes := "Julho"
	ENDIF
	IF dMesNascimento == 8
		cMes := "Agosto"
	ENDIF
	IF dMesNascimento == 9
		cMes := "Setembro"
	ENDIF
	IF dMesNascimento == 10
		cMes := "Outubro"
	ENDIF
	IF dMesNascimento == 11
		cMes := "Novembro"
	ENDIF
	IF dMesNascimento == 12
		cMes := "Dezembro"
	ENDIF

	// --QUANTIDADE DIAS DO MES--
	IF dMesNascimento == 1
		nQuantidadeDiaMes := "31"
	ENDIF
	IF dMesNascimento == 2
		nQuantidadeDiaMes := "28"
	ENDIF
	IF dMesNascimento == 3
		nQuantidadeDiaMes := "31"
	ENDIF
	IF dMesNascimento == 4
		nQuantidadeDiaMes := "30"
	ENDIF
	IF dMesNascimento == 5
		nQuantidadeDiaMes := "31"
	ENDIF
	IF dMesNascimento == 6
		nQuantidadeDiaMes := "30"
	ENDIF
	IF dMesNascimento == 7
		nQuantidadeDiaMes := "31"
	ENDIF
	IF dMesNascimento == 8
		nQuantidadeDiaMes := "31"
	ENDIF
	IF dMesNascimento == 9
		nQuantidadeDiaMes := "30"
	ENDIF
	IF dMesNascimento == 10
		nQuantidadeDiaMes := "31"
	ENDIF
	IF dMesNascimento == 11
		nQuantidadeDiaMes := "30"
	ENDIF
	IF dMesNascimento == 12
		nQuantidadeDiaMes := "31"
	ENDIF

	//  --DIA DA SEMANA--
	IF dDiaSemanaNascimento == 1
		cDiaSemanaNascimento :="Domingo-feira"
	ENDIF
	IF dDiaSemanaNascimento == 2
		cDiaSemanaNascimento :="Segunda-feira"
	ENDIF
	IF dDiaSemanaNascimento == 3
		cDiaSemanaNascimento :="Terca-feira"
	ENDIF
	IF dDiaSemanaNascimento == 4
		cDiaSemanaNascimento :="Quarta-feira"
	ENDIF
	IF dDiaSemanaNascimento == 5
		cDiaSemanaNascimento :="Quinta-feira"
	ENDIF
	IF dDiaSemanaNascimento == 6
		cDiaSemanaNascimento :="Sexta-feira"
	ENDIF
	IF dDiaSemanaNascimento == 7
		cDiaSemanaNascimento :="Sabado"
	ENDIF

	//    --ORTOGRAFIA--
	IF dIdadeDia == 1
		cIdadeDia := "dia"
	ENDIF
	IF dIDadeDia > 1
		cIdadeDia >= "dias"
	ENDIF
	IF dIdadeMes == 1
		cIdadeMes := "mes"
	ENDIF
	IF dIdadeMes > 1
		cIdadeMes := "meses"
	ENDIF

	//   --SIGNOS--
	IF (dDiaNascimento >= 21 .and. dMesNascimento == 1) .or. (dDiaNascimento <=18 .and. dMesNascimento == 2)
		cSigno := "Aquario"
	ENDIF
	IF (dDiaNascimento >= 19 .and. dMesNascimento == 2) .or. (dDiaNascimento <= 20 .and. dMesNascimento == 3)
		cSigno := "Peixes"
	ENDIF
	IF (dDiaNascimento >= 21 .and. dMesNascimento == 3) .or. (dDiaNascimento <= 20 .and. dMesNascimento == 4)
		cSigno := "Aries"
	ENDIF
	IF (dDiaNascimento >= 21 .and. dMesNascimento == 4) .or. (dDiaNascimento <= 20 .and. dMesNascimento == 5)
		cSigno := "Touro"
	ENDIF
	IF (dDiaNascimento >= 21 .and. dMesNascimento == 5) .or. (dDiaNascimento <= 20 .and. dMesNascimento == 6)
		cSigno := "Gemeos"
	ENDIF
	IF (dDiaNascimento >= 21 .and. dMesNascimento == 6) .or. (dDiaNascimento <= 22 .and. dMesNascimento == 7)
		cSigno := "Cancer"
	ENDIF
	IF (dDiaNascimento >= 23 .and. dMesNascimento == 7) .or. (dDiaNascimento <= 22 .and. dMesNascimento == 8)
		cSigno := "Leao"
	ENDIF
	IF (dDiaNascimento >= 23 .and. dMesNascimento == 8) .or. (dDiaNascimento <= 22 .and. dMesNascimento == 9)
		cSigno := "Virgem"
	ENDIF
	IF (dDiaNascimento >= 23 .and. dMesNascimento == 9) .or. (dDiaNascimento <= 22 .and. dMesNascimento == 10)
		cSigno := "Libra"
	ENDIF
	IF (dDiaNascimento >= 23 .and. dMesNascimento == 10) .or. (dDiaNascimento <= 21 .and. dMesNascimento == 11)
		cSigno := "Escorpiao"
	ENDIF
	IF (dDiaNascimento >= 22 .and. dMesNascimento == 11) .or. (dDiaNascimento <= 21 .and. dMesNascimento == 12)
		cSigno := "Sagitario"
	ENDIF
	IF (dDiaNascimento >= 22 .and. dMesNascimento == 12) .or. (dDiaNascimento <=20 .and. dMesNascimento == 1)
		cSigno := "Capricornio"
	ENDIF

	/*---------------------------- IDADE EM ANOS, MESES E DIAS ---------------------------------*/

	//dIdade := dAtual - dNascimento

	dIdadeDia := dDiaAtual - dDiaNascimento
	dIdadeMes := dMesAtual - dMesNascimento
	dIdadeAno := dAnoAtual - dAnoNascimento

	// 24/07/2023 atual
	// 20/09/1996 nascimento
	//___________
	// 04/-02/27    27 anos -2 meses e 4 dias  -> correto: 26 anos 10 meses e 4 dias

	IF dIdadeMes < 0
		dIdadeAno -= 1
		dIdadeMes := 12 - (dIdadeMes*(-1))
	ENDIF

	// 19/07/2023 atual
	// 20/09/1996 nascimento
	// __________
	// -01/-02/27   27 anos -2 meses e -1 dias  -> correto: 26 anos 10 meses e 30 dias

	IF dIdadeDia < 0 .and. dIdadeMes < 0 
		dIdadeAno -= 1
		dIdadeDia := dQuantidadeDiaMes - (dIdadeDia*(-1))
		dIdadeMes := 12 - (dIdadeMes*(-1))
	ENDIF


	// 10/09/2023 atual
	// 20/09/1996 nascimento
	// ___________
	// -10/00/27   27 anos 0 meses e 10 dias    -> correto: 26 anos 11 meses e 20 dias

	IF dIdadeDia < 0
		dIdadeAno -= 1
		dIdadeDia := nQuantidadeDiaMes - (dIdadeDia*(-1))
		dIdadeMes := 12 - (dIdadeMes*(-1))
	ENDIF


	// 27/10/2023
	// 20/09/1996
	// __________
	// 07/01/27    27 anos 1 mes e 7 dias      -> ja esta correto

	/*----- MASCARA PARA PRINT DA IDADE -----*/

	IF dIdadeAno > 0 .and. dIdadeMes > 0 .and. dIdadeDia > 0
		cIdade := AllTrim(Str(dIdadeAno)) + " anos " + AllTrim(Str(dIdadeMes)) + cIdadeMes + AllTrim(Str(dIdadeDia)) + cIdadeDia
	ENDIF
	IF dIdadeAno > 0 .and. dIdadeMes == 0 .and. dIdadeDia > 0
		cIdade := AllTrim(Str(dIdadeAno)) + " anos " + " e " + AllTrim(Str(dIdadeDia)) + cIdadeDia
	ENDIF
	IF dIdadeAno > 0 .and. dIdadeMes > 0 .and. dIdadeDia == 0
		cIdade := AllTrim(Str(dIdadeAno)) + " anos " + " e " + AllTrim(Str(dIdadeMes)) + cIdadeMes
	ENDIF

	/*------------------------------ TEMPO PARA O PROXIMO ANIVERSARIO ------------------------------*/

	dDiaAniversario := dDiaNascimento - dDiaAtual
	dMesAniversario := dMesNascimento - dMesAtual

	//   20/09 nascimento
	//   24/07 atual 
	// - ______
	//  -04/02     -> 1 meses e 27 dias 

	IF dDiaAniversario < 0 .and. dMesAniversario > 0
		dMesAniversario -= 1
		dDiaAniversario := nQuantidadeDiaMes - (dDiaAniversario*(-1))
	ENDIF


	//   20/05 nascimento
	//   24/07 atual
	// - ______
	//  -04/-02   -> 10 meses e 27  dias

	IF dDiaAniversario < 0 .and. dMesAniversario < 0
		dMesAniversario := 12 -(dMesAniversario*(-1))
		dDiaAniversario := nQuantidadeDiaMes - (dDiaAniversario*(-1))
	ENDIF


	//   30/05 nascimento
	//   24/07 atual
	// - _____
	//   06/-02     -> 10 meses e 6 dias

	IF dMesNascimento < 0
		dMesNascimento := 12 -(dMesNascimento*(-1))
	ENDIF

	// 25/07
	// 24/07
	//  1/ 0

	/*----- MASCARA PRINT DE ANIVERSARIO -----*/
	IF dMesAniversario == 1
		cMesAniversario := "mes"
	ELSE
		cMesAniversario := "meses"
	ENDIF
	IF dDiaAniversario == 1
		cDiaAniversario := "dia"
	ELSE
		cDiaAniversario := "dias"
	ENDIF

	/*----------------------------- PROXIMO ANIVERSARIO ---------------------------------*/

	IF (dDiaAtual .and. dMesAtual) <= (dDiaNascimento .and. dMesNascimento)
		dProximoAniversario := DoW(dNascimento)
	ELSE
		dProxNiver := dNascimento + 01
		dProximoAniversario := DoW(dProxNiver)
	ENDIF

	/*--------------------------------- IMPRESSAO ---------------------------------------*/

	@ 05,02 say "Data de Nascimento...................: " + AllTrim(Str(dDiaNascimento)) + " de " + cMes + " de " + AllTrim(Str(dAnoNascimento))
	@ 06,02 say "Dia da semana que nasceu.............: " + cDiaSemanaNascimento
	@ 07,02 say "Idade................................: " + cIdade
	@ 08,02 say "Signo................................: " + cSigno
	@ 09,02 say "Proximo aniversario..................: " + AllTrim(Str(dMesAniversario)) + cMesAniversario + AllTrim(Str(dDiaAniversario)) + cDiaAniversario
	@ 10,02 say "Dia da semanada do prox aniversario..: " + dProximoAniversario
	@ 12,40 say "D  S  T  Q  Q  S  S" // 40(D) 43(S) 46(T) 49(Q) 52(Q) 55(S) 58(S)

ENDDO