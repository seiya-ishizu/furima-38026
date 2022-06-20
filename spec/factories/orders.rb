FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    postcode{'123-4567'}
    prefecture_id{33}
    city{'東京都'}
    block{'1-1'}
    building{'柳ビル'}
    phone_number{'09011111111'}
    product_listing_id{1}
    user_id{1}
  end
end
