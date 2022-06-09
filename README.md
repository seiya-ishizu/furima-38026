# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| brithday           | date                | null: false               |


### Association

* has_many :product_listings 
* has_many :purchase_historys

## product_listings table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| explain                             | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| delibary_charge_id                  | integer    | null: false                    |
| ship_form_id                        | integer    | null: false                    |
| shipping_date_id                    | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one    :purchase_history

## purchase_historys table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| product_listing    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :product_listings
- has_one :shipping_addresses

## shipping_addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postcode         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- has_one :purchase_historys