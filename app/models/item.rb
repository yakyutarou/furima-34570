class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :status
  belongs_to :area
  belongs_to :day

  validates :burden_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
end
