FactoryBot.define do
  factory :product_listing do
    title              {'a'}
    explain            {'a'}
    category_id        {'2'}
    condition_id       {'3'}
    delivery_charge_id {'4'}
    prefecture_id      {'5'}
    shipping_date_id   {'6'}
    price              {'500'}

    association :user

    after(:build) do |product_listing|
      product_listing.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
