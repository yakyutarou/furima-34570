FactoryBot.define do
  factory :user do
    nickname              {'フリマ'}
    email                 {'f@ya.com'}
    password              {'000aaa'}
    password_confirmation {password}
    miyoji                {'山田'}
    namae                 {'太郎'}
    kana_miyoji           {'ヤマダ'}
    kana_namae            {'タロウ'}
    birth_date            {'1975-02-06'}
  end
end
