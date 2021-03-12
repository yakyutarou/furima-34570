class OrdersController < ApplicationController
  before_action :item2_params, only:[:index,:create]

  def index
    @order_buy = OrderBuy.new
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
    params.require(:order_buy).permit(:postal_code, :area_id, :city_name, :address, :building, :phone_number,:price).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    # クライアントサイド実装後一番最初にtoken: params[:token]を追加
    end

    def pay_item
      Payjp.api_key = "sk_test_f893b6c9954963146b7c25bb"  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
