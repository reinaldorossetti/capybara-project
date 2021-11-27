Dado('que o usuário esteja na pagina de cadastro') do
  visit '/index.php?controller=authentication&back=my-account'
  @cadastro ||= CadastroPage.new
  pp expect(@cadastro).to be_loaded
  page.driver.browser.manage.window.resize_to(1920,1080)
end

Quando('ele executar o fluxo de cadastrado') do
  @cadastro.inserir_email
  @cadastro.realizando_cadastro
  click @cadastro.btn_create_new_account
  # valida erro no cadastro.
  assert_text('There are 2 errors', count: 1)
  @cadastro.realizado_cadastro_faltando
  # valida se realmente criou a conta nova.
  assert_text('Welcome to your account. Here you can manage all of your personal information and orders.', count: 1)
end


Então('ele é direcionado para a area logada') do
  # validacao feita com os proprios metodos de assert do capybara.
  assert_selector('a', text: 'Sign out', visible: true)
end
