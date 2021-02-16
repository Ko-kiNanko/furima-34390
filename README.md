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

| Column     | Type       | Options      |
| ---------- | ---------- | ------------ |
| nickname   | string     | null: false  |
| password   | string     | null: false  |
| email      | string     | null: false  |
| birth_day  | date       | null: false  |
| full_name  | string     | null: false  |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル
| Column       | Type       | Options      |
| ------------ | ---------- | ------------ |
| item_name    | string     | null: false  |
| category     | string     | null: false  |
| price        | integer    | null: false  |
| seller       | string     | null: false  |
| item_status  | string     | null: false  |
| area         | string     | null: false  |
| delivery_fee | integer    | null: false  |
| shipping_day | integer    | null: false  |

### Association

- belongs_to :user
- has_one :purchases


## purchasesテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| buyer         | string     | null: false, foreign_key: true  |
| card_status   | string     | null: false                     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| address       | string     | null: false  |

### Association

- belongs_to :address
