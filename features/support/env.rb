require 'rspec'
require 'capybara/rspec'
require 'cucumber'
require 'webdrivers'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'report_builder'
require 'json'
require 'site_prism'
require_relative 'helper'
require 'faker'

World(BaseTests)

Webdrivers.install_dir = File.dirname(__FILE__) + '/../../webdrivers/install/dir'

BROWSER = ENV['BROWSER']
DADOS = YAML.load(File.open(File.join(File.dirname(__FILE__) + '/massa/users.yml')))

# local windows informe o caminho do chrome.
#Selenium::WebDriver::Chrome.path = 'C:\Program Files\Google\Chrome\Application\chrome.exe'

# ler as screens, para não precisar importar nas classes.
Dir[File.join(File.dirname(__FILE__), '../pages/**/*_screen.rb')].sort.each { |file| require file }
# ler as pages
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].sort.each { |file| require file }


Capybara.configure do |_config|
  case BROWSER
  when 'chrome'
    driver = :selenium_chrome
  when 'firefox'
    driver = :selenium
  when 'safari'
    Capybara.register_driver :safari_technology_preview do |app|
      Capybara::Selenium::Driver.new(
        app,
        browser: :safari
      )
    end
    driver = :safari_technology_preview
  when 'edge'
    driver = :edge
  else
    puts 'Browser não reconhecido!!! Passe o mesmo via parametro.'
  end
  # Setando a configuração do Driver como padrão.
  Capybara.default_driver = driver
  # timeout padrão na execução.
  Capybara.default_max_wait_time = 15
  Capybara.app_host = 'http://automationpractice.com'
  # Maximizar a tela ao iniciar o teste.
  Capybara.page.driver.browser.manage.window.maximize
  Capybara.page.current_window.resize_to(1366, 768)
end

