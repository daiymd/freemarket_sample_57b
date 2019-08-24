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
|nickname|string|null: false|
|e_mail|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
|tell|integer|null: false|
|image|string||
|text|text||

### Association
- has_many :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|status|string|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|
|text|text||

### Association
- belong_to :user
- belong_to :comment

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association

## atreet_adressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|prefecture|string|null: false|
|city|string|null: false|
|postal_code|integer|null: false|
|building_name|string|null: false|
|adress|integer|null: false|

### Association

## sns_credential
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|provider|||

### Association

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...