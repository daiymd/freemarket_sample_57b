class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, through: :transactions
  has_many :transactions
  has_many :comments
  has_many :likes
  has_one :street_adress
  has_many :buyers
  has_many :sellers
  has_one :payment
  has_many :evaluations       
end
