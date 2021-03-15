class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item2_params, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @order_buy = OrderBuy.new
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.present?
  end


  def create
    @order_buy = OrderBuy.new(order_params)
    if @order_buy.valid?
      pay_item
      @order_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item2_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_buy).permit(:postal_code, :area_id, :city_name, :address, :building, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
     # クライアントサイド実装後一番最初にtoken: params[:token]を追加
   end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def sold_out_item
    redirect_to root_path if @item.buy.present?
  end
end
