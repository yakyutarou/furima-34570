require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameが空だと登録できない' do
        binding.pry
      end
    end
# メールアドレスが必須であること
# メールアドレスが一意性であること
# メールアドレスは、@を含む必要があること
# パスワードが必須であること
# パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）
# パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）
# パスワードは、確認用を含めて2回入力すること
# パスワードとパスワード（確認用）は、値の一致が必須であること

     
   
    context '新規登録できないとき' do
    
    end
  end
end
