class AddColumnUserIdToshoppingLists < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_lists, :user_id, :integer
  end
end
