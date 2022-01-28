# capybara-project

Fluxo de Cadastro:
feature cadastro >> cadastro_step >> cadastro_page >> cadastro_screen

Principais gems:
```
source 'http://rubygems.org'

gem 'capybara', '~> 3.35', '>= 3.35.3'
gem 'cucumber', '~> 6.1.0'
gem 'site_prism', '~> 3.7', '>= 3.7.3'
gem 'webdrivers', '~> 5.0'
gem 'ffi', '1.15.3'
gem 'selenium-webdriver', '>= 3.142.7', '< 5.0'
````

** Versão do Ruby recomendada 2.6.X

Após instalação do ruby instalar o bundler, não esquecer de instalar a versão do ruby com devkit para windows:
```
gem install bundler
gem install pkg-config -v 1.1.7
bundler install
bundle exec cucumber
```

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

