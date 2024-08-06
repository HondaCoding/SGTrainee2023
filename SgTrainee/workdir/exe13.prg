clear

nCodigo:=0

cClassificacao:="  "

cCor:=" "

@01,01 say "informe o codigo do produto abaixo para saber sua classifica‡ao"

@02,01 get nCodigo picture "99" valid !empty(nCodigo) .and. nCodigo>0 .and. nCodigo<16
read

if nCodigo=1
   cClassificacao:="Alimento nao-perec¡vel"
      cCor:="/N"
   elseif nCodigo>=2 .and. nCodigo<=4
      cClassificacao:="Alimento perec¡vel"
      cCor:="/B"
   elseif nCodigo>=5 .and. nCodigo<=6
      cClassificacao:="Vestu rio"
      cCor:="/R"
   elseif nCodigo=7
      cClassificacao:="Higiene pessoal"
      cCor:="/W"
   elseif nCodigo>=8 .and. nCodigo<=15
      cClassificacao:="Limpeza e utens¡lios dom‚sticos"
      cCor:="/G"
endif

@04,01 say cClassificacao color cCor

@10,01 say " "
