
class ScreenLogin < SitePrism::Page

  #################  CAMPOS DE INPUT  ######################
  element :input_email,                       '#email'
  element :input_pswd,                        '#passwd'

  #################  BOTÕES  ######################
  element :btn_sign, '#SubmitLogin'

  ################## MENSAGENS #######################
  element :msg_erro_login, :xpath, '/html/body/div/div[2]/div/div[3]/div/div[1]/p'

end