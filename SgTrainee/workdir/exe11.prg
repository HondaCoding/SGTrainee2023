clear
SetMode (25,80)

cNome:=Space(30)

nIdade:=0

cCategoria:=Space(15)

@01,01 to 05,40 double

@02,02 say "digite seu nome e sua idade"
@03,02 say "NOME:"
@04,02 say "IDADE:"

@03,07 get cNome  picture "@!"  valid !empty(cNome)
@04,08 get nIdade picture "999" valid !empty(nIdade)
read

if nIdade>=5 .and. nIdade<=7
   cCategoria="infantil A: "
elseif nIdade>=8 .and. nIdade<=10
   cCategoria="infantil B: "
elseif nIdade>=11 .and. nIdade<=13
   cCategoria="juvenil A: "
elseif nIdade>=14 .and. nIdade<=17
   cCategoria="juvenil B: "
elseif nIdade>=18
   cCategoria="senior: "
endif

@06,02 say cCategoria+cNome
