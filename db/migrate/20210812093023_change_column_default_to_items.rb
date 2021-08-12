class ChangeColumnDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :is_active, :boolean, default: true, null: false
    change_column :items, :genre_id, :integer, null: false
    change_column :items, :name, :string, null: false
    change_column :items, :image_id, :string, null: false
    change_column :items, :price, :integer, null: false
    change_column :items, :introduction, :text, null: false
  end
end
