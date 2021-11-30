Dado('que o usuário esteja na pagina de Login') do
  visit '/index.php?controller=authentication&back=my-account'
  @login ||= LoginPage.new
  page.driver.browser.manage.window.resize_to(1920,1080)
  pp expect(@login).to be_loaded
end

Quando('fornecer {string} ou {string} inválidos') do |_email, _pswd|
  @login.efetuando_o_login(_email, _pswd)
end
  
Então('ele visualiza a mensagem de alerta {string}') do |msg_alert|
  msg_invalid = @login.msg_erro_login.text
  expect(msg_invalid).to eql(msg_alert)
end

Quando('fornecer login inexistente') do
  @login.usuario_inexistente
end

Então('seu acesso não é liberado') do
  msg_invalid = @login.msg_erro_login.text
  pp expect(msg_invalid).to eql('There is 1 error')
end
