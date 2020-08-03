require "fizz_buzz/version"

class InputError < StandardError; end

class FizzBuzz
  def initialize str
    @input_str = str
  end

  def response
    raise InputError unless valid?
    @input_str
  end

  private
  def valid?
    true
  end

end
