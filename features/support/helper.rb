# ler as pages e screens, para não precisar importar nas classes.
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../pages/screens/*_screen.rb')].sort.each { |file| require file }

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

  def click(element)

    # Mapeia o elemento e verifica se o elemento existe e visivel.
    element_exists?(element)
    scroll_to(element)
    element.highlight
    element.click

  rescue StandardError => e
    log e.message
    log e.backtrace
    print "Tentando via javascript"

  end

  def element_exists?(element)

    if element.visible?
      log element.inspect
      true
    end

  rescue StandardError => e
    log e.message
    log e.backtrace
    print "Tela #{page.title} - Elemento '#{element.inspect}' não encontrado."
    false

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

end


