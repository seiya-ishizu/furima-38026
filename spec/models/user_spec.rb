require 'rails_helper'
RSpec.describe User, type: :model do
    before do
    @user = FactoryBot.build(:user)
    end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "英字のみのパスワードでは登録できない" do
      expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "数字のみのパスワードでは登録できない" do
        @user.password = '111111'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = '11111あ' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "姓（全角）に半角文字が含まれていると登録できない" do
        @user.last_name = 'ya' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = 'ta' 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.last_name_kana = 'あ' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = 'あ' 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end