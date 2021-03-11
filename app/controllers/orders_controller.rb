class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_buy = OrderBuy.new
  end

  def create
  end
  
end
