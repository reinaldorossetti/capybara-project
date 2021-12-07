# capybara-project

Fluxo de Cadastro:
feature cadastro >> cadastro_step >> cadastro_page >> cadastro_screen

Teste de Janelas:
````
bundle exec cucumber -t '@janelas' BROWSER=firefox
````
Rodar todos os testes:
```
bundle exec cucumber BROWSER=firefox
bundle exec cucumber BROWSER=chrome
bundle exec cucumber BROWSER=safari
```

Os testes estão automatizados na esteira do git actions:  
workflow: https://github.com/reinaldorossetti/capybara-project/blob/main/.github/workflows/main.yml  

<a href="http://reinaldorossetti.github.io/capybara-project/firefox/index.html">firefox report<a>  
<a href="http://reinaldorossetti.github.io/capybara-project/chrome/index.html">chrome report<a>  
<a href="http://reinaldorossetti.github.io/capybara-project/safari/index.html">safari report<a>  

