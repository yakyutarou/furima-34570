class OrderBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city_name, :address, :building, :phone_number, :buy,:user_id,:item_id

  with_options presence: true do
    validates :buy
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 0 }
  end

  def save
    Buy.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, area_id: area_id, city_name: city_name, address: address, building: building, buy: buy)
  end
end
