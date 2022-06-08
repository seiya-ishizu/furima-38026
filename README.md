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

* has_many :product_listing 
* has_many :purchase_history

## product_listing table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| explain                             | text       | null: false                    |
| category_id                         | integer    | foreign_key: true              |
| condition_id                        | integer    | foreign_key: true              |
| delibary_charge_id                  | integer    | foreign_key: true              |
| ship_form_id                        | integer    | foreign_key: true              |
| shipping_date_id                    | integer    | foreign_key: true              |
| price                               | integer    | null: false                    |
| saler                               | string     | foreign_key: true              |



### Association

- belongs_to :user
- has_one    :purchase_history

## purchase_history table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| delibary_charge_id | integer    | foreign_key: true              |
| card_number        | integer    | foreign_key: true              |
| card_month         | integer    | foreign_key: true              |
| card_year          | integer    | foreign_key: true              |
| card_cvc           | integer    | foreign_key: true              |

### Association

- belongs_to :user
- has_one :product_listing 
- has_one :shipping_address

## shipping_address table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postcode         | integer    | null: false                    |
| prefecture_id    | integer    | foreign_key: true              |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |
| buyer            | string     | foreign_key: true              |

### Association

- has_one :purchase_history