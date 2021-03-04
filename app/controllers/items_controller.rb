class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_paramas)
  end

  private

  def item_paramas
    params.require(:item).permit(:image, :goods,:explanation,:category_id,:status_id,
                                  :burden_id,:area_id,:day_id,:price).merge(user_id: current_user.id)
  end
end
