# README

This README would normally document whatever steps are necessary to get the
application up and running.

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
| birthday           | date                | null: false               |

### Association

- has_many :product_listings
- has_many :purchase_histories

## product_listings table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| title              | string              | null: false                    |
| explain            | text                | null: false                    |
| category_id        | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| delivery_charge_id | integer             | null: false                    |
| prefecture_id      | integer             | null: false                    |
| shipping_date_id   | integer             | null: false                    |
| price              | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_history

## purchase_histories table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| product_listing    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product_listing
- has_one    :shipping_address

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

- belongs_to :purchase_history
