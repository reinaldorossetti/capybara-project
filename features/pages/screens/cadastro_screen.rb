class ScreenCadastro < SitePrism::Page

  #################  CAMPOS DE INPUT  ######################
  element :input_email_create, '#email_create'
  element :input_first_name, '#customer_firstname'
  element :input_last_name, '#customer_lastname'
  element :input_cad_pswd, '#passwd'
  element :input_cad_company, '#company'
  element :input_cad_address, '#address1'
  element :input_cad_city, '#city'
  element :input_post_code, 'input#postcode'
  element :input_mobile_phone, '#phone_mobile'
  element :input_address_alias, 'input#alias'

  ################# CAMPOS DE VISUALIZAÇÃO ########################33
  element :view_id_Fname, '#firstname'

  ###############  BOTÕES   ######################33
  element :btn_create_account, '#SubmitCreate'
  element :btn_create_new_account, 'button#submitAccount'
  element :btn_radio_MR, '#id_gender1'
  element :login_out, 'a[title="Log me out"]'
end
