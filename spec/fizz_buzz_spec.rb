RSpec.describe FizzBuzz do
  require "fizz_buzz"

  it "has a version number" do
    expect(FizzBuzz::VERSION).not_to be nil
  end

  describe "課題１−１：#responseがそのままの値を返すこと" do
    it "'1'は'1'を返す" do
      fizzbuzz= FizzBuzz.new('1')
      expect(fizzbuzz.response).to eq '1'
    end
    it "'9999999998'は'9999999998'を返す" do
      fizzbuzz= FizzBuzz.new('9999999998')
      expect(fizzbuzz.response).to eq '9999999998'
    end
  end
end
