class LoginPage < ScreenLogin

  include BaseTests

  def usuario_inexistente
    input_email.set(DADOS[:user_inexistente][:email])
    input_pswd.set(DADOS[:user_inexistente][:senha])
    btn_sign.highlight
    click btn_sign
  end

  def efetuando_o_login(_email, _pswd)
    input_email.highlight
    input_email.set(_email).send_keys(:tab)
    input_pswd.highlight
    input_pswd.set(_pswd).send_keys(:tab)
    btn_sign.highlight
    click btn_sign
  end

end
