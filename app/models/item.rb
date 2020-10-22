class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre_category
  belongs_to_active_hash :genre_delivery_charge
  belongs_to_active_hash :genre_item_condition
  belongs_to_active_hash :genre_prefecture
  belongs_to_active_hash :genre_shipping_day

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: "##################### "}, inclusion: { in: (300..9999999)}
    validates :item_describe
    validates :name
    validates :category_id, numericality: { other_than: 1 } 
    validates :item_condition_id, numericality: { other_than: 1 } 
    validates :delivery_charge_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :shipping_days_id, numericality: { other_than: 1 } 
    validates :user
  end
end