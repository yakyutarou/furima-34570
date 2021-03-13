FactoryBot.define do
  factory :order_buy do
    postal_code          { '123-5678' }
    area_id              { 1 }
    city_name            { 'あ' }
    address              { '3' }
    building             { 'あ' }
    phone_number         { '09045367896' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
