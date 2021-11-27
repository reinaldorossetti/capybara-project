#language: pt
# utf-8


Funcionalidade: Cadastrar Usuario
Eu como usuário quero me cadastrar no site para ter acesso as funcionalidades

Contexto: 
Dado que o usuário esteja na pagina de cadastro

@cad_user
Cenario: Cadastar usuário
Quando ele executar o fluxo de cadastrado
Então ele é direcionado para a area logada