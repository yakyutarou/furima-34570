require 'rails_helper'

RSpec.describe OrderBuy, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_buy = FactoryBot.build(:order_buy, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  it "tokenがあれば保存ができること" do
    
    expect(@order_buy).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @order_buy.token = nil
    @order_buy.valid?
    expect(@order_buy.errors.full_messages).to include("Token can't be blank")
  end

  it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること" do
    expect(@order_buy).to be_valid
  end

  it "郵便番号(pustal_code)の保存にはハイフンが必要であること（123-4567となる）" do
    @order_buy.postal_code = "1234567"
    @order_buy.valid?
    expect(@order_buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end

  it '郵便番号が空だと保存できないこと' do
   
  @order_buy.postal_code = ''
  @order_buy.valid?
  expect(@order_buy.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
  end

  it "電話番号(phone_number)は12桁以上だと保存できないこと" do
    @order_buy.phone_number = "123456789123"
    @order_buy.valid?
    expect(@order_buy.errors.full_messages).to include("Phone number is invalid")
  end


  it "電話番号は9桁以下だと登録できない" do
    @order_buy.phone_number = "090234567"
    @order_buy.valid?
    expect(@order_buy.errors.full_messages).to include("Phone number is invalid")
  end

  it "電話番号にハイフンを含むと保存できないこと" do
    @order_buy.phone_number = "09-1234-56"
    @order_buy.valid?
    expect(@order_buy.errors.full_messages).to include("Phone number is invalid")
  end

  it "電話番号は固定電話の形でも登録できること" do
   @order_buy.phone_number = "0724335678"
   expect(@order_buy).to be_valid
  end

  it '都道府県(area_id)を選択していないと保存できないこと' do
  @order_buy.area_id = 0
  @order_buy.valid?
  expect(@order_buy.errors.full_messages).to include("Area must be other than 0")
  end

  it '市区町村(city_name)は空では保存できないこと' do
  @order_buy.city_name = ''
  @order_buy.valid?
  expect(@order_buy.errors.full_messages).to include("City name can't be blank")
  end

  it '番地(address)は空では保存できないこと' do
    @order_buy.address = ''
    @order_buy.valid?
    expect(@order_buy.errors.full_messages).to include("Address can't be blank")
    end

  it '建物名(building)は空でも保存できること' do
  @order_buy.building = ''
  expect(@order_buy).to be_valid
  end
end





