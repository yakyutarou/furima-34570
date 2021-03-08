class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :updete]
  before_action :save_params, only: [:show, :edit, :update]
  before_action :edit_update, only: [:edit, :update]
  
  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :goods, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def edit_update
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def save_params
    @item = Item.find(params[:id])
 end
end
