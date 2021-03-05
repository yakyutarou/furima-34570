require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー商品登録' do
   it '商品画像を1枚つけないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
   end

   it '商品名(goods)が空だと登録できない' do
      @item.goods = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Goods can't be blank")
   end

    it '商品の説明(explanation)が空だと登録できない' do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
 
    it 'カテゴリー(category)の情報が空だと登録できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

   it '商品の状態(status)についての情報が空だと登録できない'do
    @item.status_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Status is not a number")
  end

   it '配送料の負担についての情報(burden)が空だと登録できない' do
    @item.burden_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Burden is not a number")
   end

   it '発送元の地域についての情報(area)が空だと登録できない' do
    @item.area_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Area is not a number")
   end

   it '発送までの日数についての情報(day)が空では登録できない' do
    @item.day_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Day is not a number")
   end

   it '販売価格についての情報(price)が空だと保存できない' do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
   end

   it 'userが紐付いていないと保存できないこと' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
 end
end
