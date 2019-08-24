# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|furigana|string|null: false|
|e_mail|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
|tell|integer|null: false, unique: true|
|image|string||
|text|text||
|buyer_id|integer||
|seller_id|integer||

### Association
- has_many :products, through: :transactions
- has_many :transactions
- has_many :comments
- has_many :likes
- has_one :street_adress
- has_many :buyers
- has_many :sellers
- has_one :payment
- has_many :evaluations

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|status|integer|null: false|
|delivery_price|string|null: false|
|delivery_way|string|null: false|
|scheduled|string|null: false|

### Association
- belongs_to :user, through: :transactions
- has_one :transactions
- has_many :comments
- has_many :likes
- has_one :street_adress
- has_many :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :poduct

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|status|integer|null: false|

### Association
- belongs_to :user

## street_adressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|prefecture|string|null: false|
|city|string|null: false|
|postal_code|integer|null: false|
|building_name|string||
|adress|string|null: false|

### Association
- belongs_to :user

## sns_credential
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|
|provider|string|null: false|

### Association

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|foreign_key: true|
|seller_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...