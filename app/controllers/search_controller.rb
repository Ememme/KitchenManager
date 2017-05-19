class SearchController < ApplicationController

  def index
    @storage = current_user.storages.find(params[:storage_id])
    @products = @storage.products
  end

private



  # sprawdzenie czy produkt nadaje się do spożycia
  def expired?
    @product.expiration_date.present? && (@product.expiration_date.to_date < Date.today)
  end

  # jesli data ważności wygasa za 3 dni
  def expires_soon?
    @product.expiration_date.present? && (@product.expiration_date.to_date - Date.today = 3)
  end

end
