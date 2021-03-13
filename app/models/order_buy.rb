class OrderBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city_name, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 0 }
    validates :city_name, :address
    validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ } # 携帯番号・固定電話両方可、ハイフンなし
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, area_id: area_id, city_name: city_name, address: address, building: building, phone_number: phone_number, buy: buy)
  end

  validates :token, presence: true
end
