class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :products, through: :transaction
  has_many :transactions
  has_many :comments
  has_many :likes
  has_one :street_address
  has_one :payment
  has_many :evaluations
  has_many :sns_credentials

  with_options presence: true do
    validates :name
    validates :nickname
    validates :furigana
    validates :password_confirmation
    validates :birthday
    validates :tell
  end
end
