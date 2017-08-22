class AddColumnUserIdToStorages < ActiveRecord::Migration[5.1]
  def change
    add_column :storages, :user_id, :integer
  end
end
