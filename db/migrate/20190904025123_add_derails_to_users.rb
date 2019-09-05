class AddDerailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name, :string
    change_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string
    change_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string
    change_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string
    change_column :users, :first_name_kana, :string, null: false
    add_column :users, :year, :integer
    change_column :users, :year, :integer, null: false
    add_column :users, :month, :integer
    change_column :users, :month, :integer, null: false
    add_column :users, :day, :integer
    change_column :users, :day, :integer, null: false
  end
end
