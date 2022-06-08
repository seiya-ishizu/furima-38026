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
| brithday           | string              | null: false               |


### Association

* has_many :shouhinn
* has_many :kounyuu

## shouhinn table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| image                               | string     | null: false                    |
| title                               | string     | null: false                    |
| explain                             | text       | null: false                    |
| category                            | string     | null: false                    |
| condition                           | string     | null: false                    |
| delibary_charge                     | string     | null: false                    |
| ship_form                           | string     | null: false                    |
| shipping_date                       | string     | null: false                    |
| price                               | string     | null: false                    |
| saler                               | string     | null: false                    |



### Association

- belongs_to :users
- has_one    :kounyuu

## kounyuu table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| image            | string     | null: false                    |
| title            | string     | null: false                    |
| price            | string     | null: false                    |
| delibary_charge  | string     | null: false                    |
| card_number      | string     | null: false                    |
| card_month       | string     | null: false                    |
| card_year        | string     | null: false                    |
| card_cvc         | string     | null: false                    |

### Association

- belongs_to :users
- has_one :shouhinn
- has_one :hassousaki

## hassousaki table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| postcode         | string     | null: false                    |
| prefecture_id    | string     | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     | null: false                    |
| phone_number     | string     | null: false                    |
| buyer            | string     | null: false                    |

### Association

- has_one :kounyuu