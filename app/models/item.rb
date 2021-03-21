class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :send_within
  has_many_attached :images

  with_options presence: true do
    validates :title
    validates :description
    validates :price
    validates :images, presence: { message: 'を添付してください' }
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :send_within_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
