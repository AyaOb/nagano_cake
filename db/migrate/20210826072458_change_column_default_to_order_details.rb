class ChangeColumnDefaultToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    change_column :order_details, :item_id, :integer, null: false
    change_column :order_details, :order_id, :integer, null: false
    change_column :order_details, :price, :integer, null: false
    change_column :order_details, :amount, :integer, null: false
    change_column :order_details, :making_status, :integer, default: 0, null: false
  end
end
