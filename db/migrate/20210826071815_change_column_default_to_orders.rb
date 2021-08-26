class ChangeColumnDefaultToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :customer_id, :integer, null: false
    change_column :orders, :postal_code, :string, null: false
    change_column :orders, :address, :string, null: false
    change_column :orders, :name, :string, null: false
    change_column :orders, :shipping_cost, :integer, null: false
    change_column :orders, :total_price, :integer, null: false
    change_column :orders, :payment_method, :integer, default: 0, null: false
    change_column :orders, :status, :integer, default: 0, null: false
  end
end
