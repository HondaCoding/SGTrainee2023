/*
Pedro Rufato Figueiredo

Nao consegui me lembrar como mexer com datas, entao fiz oque pude

tudo que eu nao sei fazer deixei em branco
*/

do while .t.

   clear

   setmode(24,79)
   set date to brit
   set epoch to 1980
   set century on

   cNome:=Space(25)
   nEmpregadosAnalise:=0
   nIdade:=0
   nGenero:=0
   nSalarioBase:=0
   nAdicionalNoturno:=0
   nAdicionalInsalubridade:=0

   dAtual:=Date()
   nAnoAtual:= Year(dAtual)
   nMesAtual:= Month(dAtual)
   cMesAtual:=Space(15)
   nDiaAtual:= Day(dAtual)
   nAtual:=(dAtual)

   dNacimento:=CtoD('')
   nAno:= Year(dNacimento)
   nMes:= Month(dNacimento)
   cMes:=Space(15)
   nDia:= Day(dNacimento)
   nNacimento:=(dNacimento)

   if nMes=1
      cMes="Janeiro"
   elseif nMes=2
      cMes="Fevereiro"
   elseif nMes=3
      cMes="Mar‡o"
   elseif nMes=4
      cMes="Abril"
   elseif nMes=5
      cMes="Maio"
   elseif nMes=6
      cMes="Junho"
   elseif nMes=7
      cMes="Julho"
   elseif nMes=8
      cMes="Agosto"
   elseif nMes=9
      cMes="Setembro"
   elseif nMes=10
      cMes="Outubro"
   elseif nMes=11
      cMes="Novembro"
   elseif nMes=12
      cMes="Dezembro"
   endif

   @02,02 say "Informe seus dados"
   @02,25 say "Empregados a analisar:"
   @03,02 say "Nome:"
   @04,02 say "Data de nacimento:"
   @05,02 say "Genero:            1=Masculino/2=Feminino"
   @06,02 say "Salario Base:"
   @07,02 say "Caso o salario seja maior que o permitido (8.000) havera uma redu‡ao na remunera‡ao"
   @08,02 say "Porcentual do Adicional noturno:                maximo 50%"
   @09,02 say "Porcentual do Adicional insalubridade:          maximo 50%"

   @02,23 get nEmpregadosAnalise      picture "9"         valid !empty(nEmpregadosAnalise)
   @03,06 get cNome                   picture "@!"        valid !empty(cNome)
   @04,22 get dNacimento                                  valid !empty(dNacimento)
   @05,08 get nGenero                 picture "9"         valid !empty(nGenero) .and. nGenero<3 .and. nGenero>0
   @06,17 get nSalarioBase            picture "@E 99,999" valid !empty(nSalarioBase)
   @08,34 get nAdicionalNoturno       picture "@E 9.99"   valid !empty(nAdicionalNoturno) .and. nAdicionalNoturno <=1.50 .and. nAdicionalNoturno > 1.00
   @09,40 get nAdicionalInsalubridade picture "@E 9.99"   valid !empty(nAdicionalInsalubridade) .and. nAdicionalInsalubridade <=1.50 .and. nAdicionalInsalubridade > 1.00
   read

   nSomaAno:=nNacimento-nAtual

   if nGenero=1 .and. nSomaAno<61
      Alert("Voce nao esta apto para receber sua aposentadoria")
   endif
   if nGenero=2 .and. nSomaAno<58
      Alert("Voce nao esta apta para receber sua aposentadoria")
   endif

   if nGenero=1 .And. nIdade>60
      nSalarioIrrf=0
      nSalarioNoturno=0
      nSalarioInsalubritario=0
      if nSalarioBase>8000
         nSalarioIrrf:=nSalarioBase * 1.07
         nSalarioIrrf:=nSalarioIrrf - nSalarioBase
      endif
      if nAdicionalNoturno>1.00
         nSalarioNoturno:=nSalarioBase * nAdicionalNoturno
         nSalarioNoturno:=nSalarioNoturno - nSalarioBase
      endif
      if nAdicionalInsalubridade>1.00
         nSalarioInsalubritario:=nSalarioBase * nAdicionalInsalubridade
         nSalarioInsalubritario:=nSalarioInsalubritario - nSalarioBase
      endif

      nSalarioTotal:= nSalarioBase + nSalarioInsalubritario + nSalarioNoturno - nSalarioIrrf

      @13,02 say nSalarioTotal
   endif

    if nGenero=2 .And. nIdade>57
      nSalarioIrrf=0
      nSalarioNoturno=0
      nSalarioInsalubritario=0
      if nSalarioBase>8000
         nSalarioIrrf:=nSalarioBase * 1.07
         nSalarioIrrf:=nSalarioIrrf - nSalarioBase
      endif
      if nAdicionalNoturno>1.00
         nSalarioNoturno:=nSalarioBase * nAdicionalNoturno
         nSalarioNoturno:=nSalarioNoturno - nSalarioBase
      endif
      if nAdicionalInsalubridade>1.00
         nSalarioInsalubritario:=nSalarioBase * nAdicionalInsalubridade
         nSalarioInsalubritario:=nSalarioInsalubritario - nSalarioBase
      endif

      nSalarioTotal:= nSalarioBase + nSalarioInsalubritario + nSalarioNoturno - nSalarioIrrf

      @13,02 say nSalarioTotal
   endif
   if lastkey()==27
      nOpcao:=Alert("Processar", {'Cancelar','Retornar'})
      if nOpcao ==1
         exit
      endif
      if nOpcao ==2
         loop
      endif
   endif

   inkey(0)

enddo

