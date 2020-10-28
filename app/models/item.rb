class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_describe
    validates :category_id, numericality: { other_than: 0, message: "must be choiced" } 
    validates :item_condition_id, numericality: { other_than: 0, message: "must be choiced" } 
    validates :delivery_charge_id, numericality: { other_than: 0, message: "must be choiced" } 
    validates :prefecture_id, numericality: { other_than: 0, message: "must be choiced" } 
    validates :shipping_days_id, numericality: { other_than: 0, message: "must be choiced" } 
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: (300..9999999), message: "is invalid. Input half-width numbers and must be over ¥300 and under ¥9,999,999 "}
    validates :user
  end

end