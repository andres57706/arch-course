# frozen_string_literal: true

# Product class
# this class should had 6 args, also need setters for this args
# if arg5 and arg6 are not assigned, they will be assigned to
# the default values
class Product
  ALLOWED_ARGS = 6.times.map do |index|
    "arg#{index + 1}"
  end.freeze

  DEFAULT_VALUES = {
    'arg5': 'DEFAULT ARG 5',
    'arg6': 'DEFAULT ARG 6'
  }.freeze

  # Constructor method
  def initialize
    ALLOWED_ARGS.each do |arg|
      self.class.define_method "set_#{arg}".to_sym do |value|
        # assign default value
        default_values unless DEFAULT_VALUES.keys.include? value.to_s
        # assgisn arg value
        instance_variable_set("@#{arg}".to_sym, value)
        self
      end
    end
  end

  private

  def default_values
    DEFAULT_VALUES.each do |k, v|
      instance_variable_set("@#{k}".to_sym, v)
    end
  end
end
