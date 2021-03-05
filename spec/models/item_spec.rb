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
      @item.goods = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Goods can't be blank")
    end

    it '商品の説明(explanation)が空だと登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリー(category)が未選択だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態(status)が未選択だと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '配送料の負担についての情報(burden)が未選択だと登録できない' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden must be other than 1')
    end

    it '発送元の地域についての情報(area)が未選択だと登録できない' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 0')
    end

    it '発送までの日数についての情報(day)が未選択だと登録できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end

    it '販売価格についての情報(price)が空だと保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が300円未満だと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 299')
    end

    it '販売価格が9999999円より大きいと保存されない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
