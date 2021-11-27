Dado('que o usuário esteja na pagina de cadastro') do
  visit '/index.php?controller=authentication&back=my-account'
  @cadastro ||= CadastroPage.new
  pp expect(@cadastro).to be_loaded
  @cadastro.execute_script 'window.scrollBy(0,100)'
  page.driver.browser.manage.window.resize_to(1920,1080)
end

Quando('ele executar o fluxo de cadastrado') do
  @cadastro.input_email_create.send_keys(Faker::Internet.email)
  click @cadastro.btn_create_account
  @cadastro.wait_until_btn_radio_MR_visible
  @cadastro.btn_radio_MR.click
  @cadastro.input_first_name.send_keys(Faker::Name.first_name)
  @cadastro.input_last_name.send_keys(Faker::Name.last_name)
  @cadastro.input_cad_pswd.send_keys(DADOS[:cad_user][:_password])
  @cadastro.input_cad_company.send_keys(DADOS[:cad_user][:_company])
  @cadastro.input_cad_address.send_keys(DADOS[:cad_user][:_address])
  @cadastro.input_cad_city.send_keys(DADOS[:cad_user][:_city])
  select_value @cadastro.seleciona_cad_city, 'United States'
  @cadastro.input_post_code.send_keys(DADOS[:cad_user][:_post_cod])
  @cadastro.input_mobile_phone.send_keys(Faker::PhoneNumber.cell_phone)
  #pp take_first_name = @cadastro.view_id_Fname.value
  #expect(take_first_name).to eql(msg_alert)
  sleep 6000
end


Então('ele é direcionado para a area logada') do
 pega_texto = @cadastro.view_id_Fname.value
 pp pega_texto
end
