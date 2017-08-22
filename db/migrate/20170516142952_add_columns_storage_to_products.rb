class AddColumnsStorageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :storage1, :string
    add_column :products, :storage2, :string
    add_column :products, :storage3, :string
  end
end
