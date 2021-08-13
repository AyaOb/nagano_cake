class ChangeColumnNullToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :cart_itemes, :cart_items
    change_column :genres, :name, :string, null: false
  end
end
