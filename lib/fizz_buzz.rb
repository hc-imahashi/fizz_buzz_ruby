require "fizz_buzz/version"

class InputError < StandardError; end

class FizzBuzz
  def initialize str
    @input_number = str.split.first.to_i
  end

  def response
    raise InputError unless valid?
    if @input_number%3 == 0
      "Fizz"
    else
      @input_number.to_s
    end
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
