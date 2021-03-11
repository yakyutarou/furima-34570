class OrdersController < ApplicationController
  before_action :item2_params, only:[:index,:create]

  def index
    @order_buy = OrderBuy.new
  end

  def create
    @order_buy = OrderBuy.new(order_params)
    if @order_buy.valid?
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
    params.require(:order_buy).permit(:postal_code, :area_id, :city_name, :address, :building, :phone_number,:price).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
