class ProductListing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
    
  validates :image, :title, :explain, :price, presence: true

  validates :category_id , numericality: { other_than: 1}
  validates :condition_id , numericality: { other_than: 1}
  validates :delivery_charge_id , numericality: { other_than: 1}
  validates :prefecture_id , numericality: { other_than: 1}
  validates :shipping_date_id , numericality: { other_than: 1}
  validates :price, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
end
