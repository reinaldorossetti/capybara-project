require_relative 'screens/cadastro_screen'

class CadastroPage < ScreenCadastro

  def seleciona_cad_state
    '#account-creation_form select[id=id_state]'
  end

  def seleciona_cad_city
    'select#id_country'
  end

end
