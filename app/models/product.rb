class Product < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  has_many :comments
  has_many :likes
  has_one :street_address
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category

  enum product_details: {
    "--":0, "レディース":1, "メンズ":2, "トップス":3, "パンツ":4, "シャツ":5, "キャミソール":6, "チノパン":7, "ジーンズ":8, "パンツ":9, "時計":10, "腕時計":11, "レザーベルト":12, "スラックス":13, "ショートパンツ":14
  },_prefix:true
end
