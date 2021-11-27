class LoginPage < ScreenLogin

  def usuario_inexistente
    input_email.set(DADOS[:user_inexistente][:email])
    input_pswd.set(DADOS[:user_inexistente][:senha])
    btn_sign.highlight
    click btn_sign
  end

end
