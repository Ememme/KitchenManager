class CreateProductsTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :products_types do |t|
      t.string :product_type
      t.string :unit

      t.timestamps
    end
  end
end
