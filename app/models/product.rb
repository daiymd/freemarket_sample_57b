class Product < ApplicationRecord

  has_many :transactions
  has_many :users, through: :transactions
  has_many :comments
  has_many :likes
  has_one :street_address
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :status
    validates :delivery_price
    validates :delivery_way
    validates :scheduled
    validates :text
    validates :prefecture
    validates :category_id
  end

  enum status: {
    "--":0, "新品、未使用":1, "未使用に近い":2, "目立った傷や汚れなし":3, "やや傷や汚れあり":4, "傷や汚れあり":5, "全体的に状態が悪い":6
  }
end
