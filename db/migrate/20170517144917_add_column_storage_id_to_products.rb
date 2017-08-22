class AddColumnStorageIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :storage_id, :integer
  end
end
