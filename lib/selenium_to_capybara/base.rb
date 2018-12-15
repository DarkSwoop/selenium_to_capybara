module SeleniumToCapybara
    
  class Base
    attr_reader :side_command
    def initialize(side_command)
      @side_command = side_command
    end

    def target
      @side_command['target']
    end

    def targets
      @side_command['targets']
    end

    def value
      @side_command['value']
    end

    def command
      @side_command['command']
    end

    def comment
      @side_command['comment']
    end

    def id
      @side_command['id']
    end

    def selector_type
      _selector_type(target)
    end

    def selector
      _selector(target)
    end

    # returns the translation of the command or a warning if the command can't be translated
    def translate
      method_id = command.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      if self.class.public_method_defined?(method_id)
        # the translation itself
        translation = public_send(method_id)
        return "# WARNING: '#{command}' found but the selector_type '#{selector_type}' is unhandled." if translation.nil?

        # add the alternative selectors as comments if present
        if targets.size > 1
          "#{commented_targets.join("\n")}\n#{translation}"
        else
          translation
        end
      else
        "# WARNING: Conversion for '#{command}' not found."
      end
    end

    private

    def split_target(target)
      /^(\w+)=(.*)$/.match(target)[1..2]
    end

    def _selector(target)
      split_target(target).last
    end

    def _selector_type(target)
      split_target(target).first
    end

    def commented_targets
      targets.map { |target| "# #{_selector_type(target.first)}: #{_selector(target.first)}" }.uniq
    end

  end

end
