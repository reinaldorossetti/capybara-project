module CapybaraExtension
  def jquery(event)
    base.jquery(event)
  end

  def highlight(color = "yellow")
    base.highlight(color)
  end
end

module CapybaraSeleniumExtension
  def jquery(evento)
    dir_atual = File.expand_path File.dirname(__FILE__) # pega o caminho do arquivo
    js = File.read("#{dir_atual}/jquery.min.js") # ler o arquivo jquery
    driver.execute_script(js)
    driver.execute_script("$(arguments[0]).trigger(\"#{evento}\")", native)
  end

  def highlight(color)
    dir_atual = File.expand_path File.dirname(__FILE__) # pega o caminho do arquivo
    js = File.read("#{dir_atual}/jquery.min.js") # ler o arquivo jquery
    driver.execute_script(js)
    driver.execute_script("$(arguments[0]).css({'border':'3px solid #{color}'});", native)
  end
end

# importando funcao para dentro do framework
::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension

module BaseTests

  def wait_for_pageload(count = 5)
    init = 0
    until page.execute_script("return document.readyState").eql?('complete') || init == count
      sleep 1
      print init += 1
      raise ArgumentError, "Page not loaded fully" if init == count
    end
  end

  # Clique com scroll e verifica se o elemento existe e visivel.
  def click(element)
    element_exists?(element)
    scroll_to(element)
    element.highlight
    element.click
  end

  def element_exists?(element)
    if element.visible?
      element.inspect
      true
    end
  end

  # Custom Function select box with parameter value.
  # @param [String] locator
  # @param [String] option_value
  # @return [void] return void or error message.
  def select_value(locator, option_value)
    element = find(locator, visible: false)
    scroll_to(element)
    element.find(:option, option_value).select_option
  end

  def add_screenshot(scenario)
    sufix = ('error' if scenario.failed?) || 'success'
    name = scenario.name.tr(' ', '_').downcase
    foto = save_screenshot("images/#{sufix}-#{name}.png")
    base64_img = Base64.encode64(File.open(foto, 'rb:UTF-8', &:read))
    attach(base64_img, 'image/png;base64')
  end

end


