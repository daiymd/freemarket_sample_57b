class Product < ApplicationRecord
  # belongs_to :user, through: :transaction
  # has_one :transaction
  has_many :comments
  has_many :likes
  has_one :street_address
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  mount_uploader :image, ImageUploader
end
