class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :status
  belongs_to :area
  belongs_to :day

  validates :goods, :explanation, :image, :price, presence: true
  
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  with_options numericality: { other_than: 1 } do
    validates :burden_id
    validates :category_id
    validates :status_id
    validates :day_id
  end
end
