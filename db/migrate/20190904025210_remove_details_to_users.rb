class RemoveDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    remove_column :users, :furigana, :string
    remove_column :users, :birthday, :string
  end
end
