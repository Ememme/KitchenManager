class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :storages, dependent: :destroy
  has_many :products, through: :storages
  # has_many :storage
  # has_one :shopping_list
end
