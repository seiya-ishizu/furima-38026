require 'rails_helper'

RSpec.describe ProductListing, type: :model do
    before do
    @product_listing = FactoryBot.build(:product_listing)
    end

    describe "商品の出品" do
      context '商品出品できる場合' do
        it "全ての項目が入力されていれば登録できる" do
        expect(@product_listing).to be_valid
        end
      end
      context '商品出品できない場合' do
        it "商品画像が空だと出品できない" do
          @product_listing.image = nil  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が空だと出品できない" do
          @product_listing.title = ''  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Title can't be blank")
        end
        it "商品の説明が空だと出品できない" do
          @product_listing.explain = ''  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Explain can't be blank")
        end
        it "カテゴリーが空だと出品できない" do
          @product_listing.category_id = '1'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態が空だと出品できない" do
          @product_listing.condition_id = '1'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Condition must be other than 1")
        end
        it "配送料の負担が空だと出品できない" do
          @product_listing.delivery_charge_id = '1'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Delivery charge must be other than 1")
        end
        it "発送元の地域が空だと出品できない" do
          @product_listing.prefecture_id = '1'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "発送までの日数が空だと出品できない" do
          @product_listing.shipping_date_id = '1'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Shipping date must be other than 1")
        end
        it "価格が空だと出品できない" do
          @product_listing.price = ''  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Price can't be blank")
        end
        it "価格が数字でないと出品できない" do
          @product_listing.price = ''  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Price is not included in the list")
        end
        it "価格が¥300より少ない時は出品できないこと" do
          @product_listing.price = '299'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Price is not included in the list")
        end
        it "価格が¥10,000,000より大きいと出品できない" do
          @product_listing.price = '10_000_000'  
          @product_listing.valid?
          expect(@product_listing.errors.full_messages).to include("Price is not included in the list")
        end
      end
    end
  end


