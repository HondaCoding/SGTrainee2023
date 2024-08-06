clear

set date to brit
set epoch to 1930

dBrancos:= CToD('')

cLetra:=Space(1)

nNumero:=0

cString:=Space(15)

@02,02 say "LETRA"
@04,02 say "data"
@06,02 say "numero"
@08,02 say "numero com decimal"
@10,02 say "string"

@02,08 get cLetra  picture "@!"      valid !empty(cLetra) .and. !(cLetra $ "1234567890")
@04,06 get dBrancos                  valid !empty(dBrancos)
@06,08 get nNumero picture "9"       valid !empty(nNumero)
@08,20 get nNumero picture "@E 9.99" valid !empty(nNumero)
@10,08 get cString picture "@!"      valid !empty(cString)
read

