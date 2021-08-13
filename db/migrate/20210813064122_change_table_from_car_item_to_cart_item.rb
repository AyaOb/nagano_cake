class ChangeTableFromCarItemToCartItem < ActiveRecord::Migration[5.2]
  def change
    change_column :car_items, :item_id, :integer, null: false
    change_column :car_items, :customer_id, :integer, null: false
    change_column :car_items, :amount, :integer, null: false
    rename_table :car_items, :cart_itemes
  end
end
