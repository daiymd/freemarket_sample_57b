class AddDetailsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :text, :text
    change_column :products, :text, :text, null: false
    add_column :products, :category_id, :integer
    change_column :products, :category_id, :integer, null: false
    add_column :products, :prefecture, :string
    change_column :products, :prefecture, :string, null: false
  end
end