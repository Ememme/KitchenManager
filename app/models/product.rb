class Product < ApplicationRecord
  # scope :expiration_date { order('expiration_date ASC') }
  belongs_to :storage
  belongs_to :products_type

  validates :product_name, presence: true, length: { minimum: 3 }
  validates :quantity, numericality: true
  validates :product_type_id, presence: true
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  # scope :expires_soon, -> do
  #   where()
  # end
  #
  #
  # scope :in_stock, -> do
  #   where(
  #     'quantity = ?', > 1
  #   ).order(id: :desc)
  # end
  #
  # scope :running_low, -> do
  #   where(
  #     'quantity = ?', 1
  #   ).order(id: :desc)
  # end
  #
  # scope :out_of_stock, -> do
  #   where(
  #    'quantity = ?', 0
  #   ).order(id: :desc)
  # end

  # sprawdzenie czy produkt nadaje się do spożycia
  def expired?
    expiration_date.present? && (expiration_date.to_date < Date.today)
  end

  # jesli data ważności wygasa za 3 dni
  def expires_soon?
    expiration_date.present? && (expiration_date.to_date - Date.today = 3)
  end

end
