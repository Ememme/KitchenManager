class RenameTableProductsType < ActiveRecord::Migration[5.1]
  def change
    rename_table :products_types, :product_types
  end
end
