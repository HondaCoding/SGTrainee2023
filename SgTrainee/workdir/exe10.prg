clear

nIdade:= 0

@02,02 say "digite sua idade:"

@02,18 get nIdade picture "999" valid !empty(nIdade)
read

if nIdade >= 21
   @03,02 say "voce tem a idade necessaria"
else
   @03,02 say "voce nao tem a idade necessaria"
endif



