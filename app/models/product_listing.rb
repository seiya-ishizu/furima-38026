class ProductListing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
    
  validates :title, :text, :price presence: true

  validates :genre_id, numericality: { other_than: 1 validates :genre_id, numericality: { other_than: 1 } } 
end
