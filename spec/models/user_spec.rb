require 'rails_helper'
RSpec.describe User, type: :model do
    before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do  
      user.nickname = ''  
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("password_confirmation can't be blank")
    end
    it "last_nameが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("last_name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("first_name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("last_name_kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("first_name_kana can't be blank")
    end
    it "birthdayが空では登録できない" do
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include("birthday can't be blank")
    end
  end
end