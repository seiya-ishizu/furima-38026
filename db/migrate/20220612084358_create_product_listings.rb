class CreateProductListings < ActiveRecord::Migration[6.0]
  def change
    create_table :product_listings do |t|
      t.string :title, null: false
      t.text :explain, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_date_id, null: false
      t.integer :price, null: false
      t.integer :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
