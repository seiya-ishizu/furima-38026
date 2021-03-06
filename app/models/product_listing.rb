class ProductListing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  has_one    :purchase_history
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

    
  validates :image, :title, :explain, :price, presence: true

  validates :category_id , numericality: { other_than: 1}
  validates :condition_id , numericality: { other_than: 1}
  validates :delivery_charge_id , numericality: { other_than: 1}
  validates :prefecture_id , numericality: { other_than: 1}
  validates :shipping_date_id , numericality: { other_than: 1}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
end
