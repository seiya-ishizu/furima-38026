class Order
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :product_listing_id, :token

  with_options presence: true do
    
    validates :city, :block, :user_id, :product_listing_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :token, presence: true
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, product_listing_id: product_listing_id)
    ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end

end