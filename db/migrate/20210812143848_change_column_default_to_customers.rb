class ChangeColumnDefaultToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :last_name, :string, null: false
    change_column :customers, :first_name, :string, null: false
    change_column :customers, :last_name_kana, :string, null: false
    change_column :customers, :first_name_kana, :string, null: false
    change_column :customers, :postal_code, :string, null: false
    change_column :customers, :address, :string, null: false
    change_column :customers, :telephone_number, :string, null: false
    change_column :customers, :is_active, :boolean, default: true, null: false
  end
end
