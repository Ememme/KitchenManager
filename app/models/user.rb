class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :add_default_storage_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :storages, dependent: :destroy
  has_many :products, through: :storages

  private

  def add_default_storage_type
    Storage.create(storage_name: 'fridge', user_id: self.id)
    Storage.create(storage_name: 'refrigerator', user_id: self.id)
    Storage.create(storage_name: 'pantry', user_id: self.id)
  end
end
