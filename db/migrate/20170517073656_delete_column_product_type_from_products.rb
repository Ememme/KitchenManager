class DeleteColumnProductTypeFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :product_type
    remove_column :products, :unit
    remove_column :products, :user_id
    remove_column :products, :storage1
    remove_column :products, :storage2
    remove_column :products, :storage3
  end
end
