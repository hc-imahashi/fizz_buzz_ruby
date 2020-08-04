RSpec.describe FizzBuzz do
  require "fizz_buzz"

  it "has a version number" do
    expect(FizzBuzz::VERSION).not_to be nil
  end

  shared_examples "#response" do |in_str, out_str|
    it (in_str.to_s+'は'+out_str.to_s+'を返す') {
      fizzbuzz= FizzBuzz.new(in_str)
      expect(fizzbuzz.response).to eq out_str
    }
  end

  describe "課題１−１：#responseがそのままの値を返すこと" do
    it_behaves_like "#response", '1','1'
    it_behaves_like "#response", '9999999998','9999999998'
  end

  describe "課題１−２：不正入力に対してエラー" do
    shared_examples "raise_inputerr" do |str|
      it (str.to_s+'ではInputError例外が発生する') {
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
      it_behaves_like "#response", '1.589','1'
    end
    context "ホワイトの後ろはあっても無視" do
      it_behaves_like 'raise_inputerr', 'A 3'
      it_behaves_like "#response", '791 あいうえお','791'
    end
  end

  describe "課題１−３：3の倍数の場合Fizz" do
    it_behaves_like "#response", '3','Fizz'
    it_behaves_like "#response", '9999999999','Fizz'
  end

  describe "課題１−４：5の倍数の場合Buzz" do
    it_behaves_like "#response", '5','Buzz'
    it_behaves_like "#response", '1000000000','Buzz'
  end

  describe "課題１−５：3と5の倍数の場合FizzBuzz" do
    it_behaves_like "#response", '15','FizzBuzz'
    it_behaves_like "#response", '1000000005','FizzBuzz'
  end

end
