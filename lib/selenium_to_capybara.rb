require "selenium_to_capybara/version"
require 'selenium_to_capybara/base'
require 'selenium_to_capybara/minitest'

module SeleniumToCapybara

  def self.to_minitest(name, commands)
    test_commands = commands.map do |command|
      Minitest.new(command).translate
    end

    warning_present = test_commands.any? {|translation| translation.start_with?('# WARNING:')}

    output = []
    output << <<~EOS
      test '#{name}' do
      #{test_commands.map {|x| "  #{x.gsub(/\n/, "\n  ")}"}.join("\n\n")}
      end
    EOS
    output << "\n# WARNING: Some commands are unhandled. Please contribute here: https://github.com/DarkSwoop/selenium_to_capybara" if warning_present
    output.join("\n")
  end

end
