class AddColumnProductIdToProductsTypes < ActiveRecord::Migration[5.1]
  def change
      add_column :products_types, :product_id, :integer
  end
end
