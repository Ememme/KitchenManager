class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :quantity
      t.date :expiration_date
      t.string :product_type

      t.timestamps
    end
  end
end
