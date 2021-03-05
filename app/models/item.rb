class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :status
  belongs_to :area
  belongs_to :day

  validates :goods, :explanation, :image, :price, presence: true
  validates :burden_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
  validates :day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end
