set date brit
set epoch to 1940
clear

dNascimento := CToD('')
dAtual      := Date()

@ 01,01 say "Data Atual: "
@ 02,01 say "Data de Nascimento: "

@ 01,13 GET dAtual
@ 02,21 GET dNascimento valid dNascimento<dAtual .and. !Empty(dNascimento)
Read



InKey(0)
