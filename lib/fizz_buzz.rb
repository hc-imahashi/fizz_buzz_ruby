require "fizz_buzz/version"

class InputError < StandardError; end

class FizzBuzz
  def initialize str
    @input_number = str.split.first.to_i
  end

  def response
    raise InputError unless valid?
    @input_number.to_s
  end

  private
  def valid?
    if @input_number.nil?
      false
    elsif @input_number > 0
      true
    else
      false
    end
  end

end
