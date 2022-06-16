class ProductListingsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]

  def new
    @product_listing = ProductListing.new
  end

  def create
    @product_listing = ProductListing.create(product_listing_params)
    if @product_listing.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def index
    @product_listings = ProductListing.order("created_at DESC")
  end

  def show
    @product_listing = ProductListing.find(params[:id])
  end

  def destroy
  end


  private

  def product_listing_params
    params.require(:product_listing).permit(:title,:image,:explain,:category_id,:condition_id,:delivery_charge_id,:prefecture_id ,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  

end