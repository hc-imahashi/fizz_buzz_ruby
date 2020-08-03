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

  describe "課題１−２：不正入力に対してエラー" do
    shared_examples "raise_inputerr" do |str|
      it {
        fizzbuzz= FizzBuzz.new(str)
        expect{fizzbuzz.response}.to raise_error(InputError)
      }
    end

    context "数字以外の文字列" do
      it_behaves_like 'raise_inputerr', 'あいうえお'
      it_behaves_like 'raise_inputerr', '(###%^"'
    end
    context "全角数字" do
      it_behaves_like 'raise_inputerr', '１５'
      it_behaves_like 'raise_inputerr', 'ー４７０２'
    end
    context "0以下の数字" do
      it_behaves_like 'raise_inputerr', '0'
      it_behaves_like 'raise_inputerr', 'ｰ65536'
    end
    context "小数は丸められます" do
      it_behaves_like 'raise_inputerr', '.499'
      it ('1.589') {
        fizzbuzz= FizzBuzz.new('1.589')
        expect(fizzbuzz.response).to eq '1'
      }
    end
    context "ホワイトの後ろはあっても無視" do
      it_behaves_like 'raise_inputerr', 'A 3'
      it ('790 あいうえお') {
        fizzbuzz= FizzBuzz.new('790 あいうえお')
        expect(fizzbuzz.response).to eq '790'
      }
    end
  end
end
