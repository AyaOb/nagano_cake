class ChangeColumnDefaultToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :customer_id, :integer, null: false
    change_column :addresses, :name, :string, null: false
    change_column :addresses, :postal_code, :string, null: false
    change_column :addresses, :address, :string, null: false
  end
end
