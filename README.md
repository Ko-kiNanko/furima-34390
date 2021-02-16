<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

## usersテーブル

| Column               | Type       | Options                    |
| -------------------- | ---------- | -------------------------- |
| nickname             | string     | null: false                |
| encrypted_password   | string     | null: false                |
| email                | string     | null: false, unique: true  |
| birth_day            | date       | null: false                |
| last_name            | string     | null: false                |
| first_name           | string     | null: false                |
| last_name_kana       | string     | null: false                |
| first_name_kana      | string     | null: false                |



### Association

- has_many :items
- has_many :purchases


## itemsテーブル
| Column          | Type       | Options      |
| --------------- | ---------- | ------------ |
| item_name       | string     | null: false  |
| category_id     | integer    | null: false  |
| price           | integer    | null: false  |
| item_status_id  | integer    | null: false  |
| information     | text       | null: false  |
| prefecture_id   | integer    | null: false  |
| delivery_fee_id | integer    | null: false  |
| shipping_day_id | integer    | null: false  |

### Association

- belongs_to :user
- has_one :purchases


## purchasesテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user          | references | null: false, foreign_key: true  |
| item          | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :details


## detailsテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| purchase      | references | null: false, foreign_key: true  |
| post_number   | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| municipality  | string     | null: false                     |
| address       | string     | null: false                     |
| building_name | string     |                                 |
| phone_number  | string     | null: false                     |

### Association

- belongs_to :purchase
