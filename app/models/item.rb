class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to: :user
  belongs_to: :category
  belongs_to: :condition
  belongs_to: :delivery_fee
  belongs_to: :prefecture
  belongs_to: :send_within

  validates :title, :description, :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :send_within_id, numericality: { other_than: 1 }
end
