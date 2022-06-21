class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index] 
  before_action :set_message, only: [:index, :create]

  def index
    @order = Order.new
    if @product_listing.user_id == current_user.id || @product_listing.purchase_history.present?
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path 
    else
      render :index
    end
  end

private

  def order_params
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, product_listing_id: params[:product_listing_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product_listing.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_message
    @product_listing = ProductListing.find(params[:product_listing_id])
  end

end
