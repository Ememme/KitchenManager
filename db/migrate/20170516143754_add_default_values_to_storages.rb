class AddDefaultValuesToStorages < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:products, :storage1, from: nil, to: "Fridge")
    change_column_default(:products, :storage2, from: nil, to: "Refrigerator")
    change_column_default(:products, :storage3, from: nil, to: "Pantry")
  end
end
