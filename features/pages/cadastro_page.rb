class CadastroPage < ScreenCadastro

  include BaseTests

  def initialize
    super
    pp @fist_name = Faker::Name.first_name
    pp @last_name = Faker::Name.last_name
    pp @email = Faker::Internet.email
    pp @cell_fone = Faker::PhoneNumber.cell_phone
  end

  def seleciona_cad_state
    '#account-creation_form select[id=id_state]'
  end

  def seleciona_cad_city
    'select#id_country'
  end

  def realizando_cadastro
    click btn_radio_MR
    input_first_name.send_keys(@fist_name)
    input_last_name.send_keys(@fist_name)
    input_cad_pswd.send_keys(DADOS[:cad_user][:_password])
    input_cad_company.send_keys(DADOS[:cad_user][:_company])
    input_cad_address.send_keys(DADOS[:cad_user][:_address])
    input_cad_city.send_keys(DADOS[:cad_user][:_city])
    input_mobile_phone.send_keys(@cell_fone)
    pp @lias = @fist_name.delete(' ') + @last_name.delete(' ')
    # uso do set para enviar o texto e limpar o campo.
    input_address_alias.set(@lias)
  end

  def realizado_cadastro_faltando
    input_cad_pswd.send_keys(DADOS[:cad_user][:_password])
    input_post_code.send_keys(DADOS[:cad_user][:_post_cod])
    select_value seleciona_cad_city, 'United States'
    select_value seleciona_cad_state, 'Florida'
    click btn_create_new_account
  end

  def inserir_email
    input_email_create.send_keys(@email)
    click btn_create_account
  end

end
