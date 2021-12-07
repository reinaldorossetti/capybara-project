Quando('eu entro na janela e verifico a mensagem - opção 1') do
  visit 'https://automacaocombatista.herokuapp.com/mudancadefoco/janela'

  #janela recebe uma janela que foi aberta pelo link
  janela = window_opened_by do
    click_link 'Clique aqui'
  end

  #muda de foco para a janela
  within_window janela do
    @mensagem = find('.red-text.text-darken-1.center', visible:true)
    expect(current_url).to eq 'https://automacaocombatista.herokuapp.com/mudancadefoco/newwindow'
    expect(@mensagem.text).to eq 'Você Abriu uma nova janela!!'
    janela.close # fecha a ultima janela
    sleep(5) # somente pra ver a janela
  end

end

Quando('eu entro na janela e verifico a mensagem - opção 2') do
  visit 'https://automacaocombatista.herokuapp.com/mudancadefoco/janela'
  #segunda opcao
  click_link 'Clique aqui'
  #mudando para ultima aba
  switch_to_window windows.last
  @mensagem = find('.red-text.text-darken-1.center', visible:true)
  expect(current_url).to eq 'https://automacaocombatista.herokuapp.com/mudancadefoco/newwindow'
  expect(@mensagem.text).to eq 'Você Abriu uma nova janela!!'
  windows.last.close # fecha a ultima janela
  switch_to_window windows.first
  sleep(5) # somente pra ver a janela
end