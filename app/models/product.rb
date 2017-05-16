class Product < ApplicationRecord
  # scope :expiration_date { order('expiration_date ASC') }
  belongs_to :user
  belongs_to :storage

  validates :product_name, presence: true, length: { minimum: 3 }
  validates :quantity, numericality: true
  validates :product_type, presence: true
  validates :unit, presence: true
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
