require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての項目が入力されていると登録できる' do
      @user = FactoryBot.build(:user)
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したemailが存在する場合存在できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは、@を含む必要があること' do
      @user.email = 'fya.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'passwordが空では保存できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a0a0a0'
      @user.password_confirmation = 'a0a0a0'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a0a0a'
      @user.password_confirmation = 'a0a0a'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'passwordは、半角英数字が混合されていれば、登録が可能なこと' do
      @user.password = 'a0a0a0'
      @user.password_confirmation = 'a0a0a0'
      expect(@user).to be_valid
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '12ee56'
      @user.password_confirmation = '12ee567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角では登録できないこと' do
      binding.pry
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'ユーザー本名は、miyojiとnamaeがあれば登録できる' do
      @user.miyoji = '佐藤'
      @user.namae = '弘'
      expect(@user).to be_valid
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）以外での登録ができない' do
      @user.miyoji = 'satou'
      @user.namae = 'hiroshi'
      @user.valid?
      expect(@user.errors.full_messages).to include('Miyoji is invalid', 'Namae is invalid')
    end

    it 'ユーザー本名のフリガナは、kana_miyojiとkana_namaeが空だと登録できない' do
      @user.kana_miyoji = ''
      @user.kana_namae = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana miyoji can't be blank", "Kana namae can't be blank")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）以外だと登録ができない' do
      @user.miyoji = 'さs佐'
      @user.namae = 'ひhi弘'
      @user.valid?
      expect(@user.errors.full_messages).to include('Miyoji is invalid', 'Namae is invalid')
    end

    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
