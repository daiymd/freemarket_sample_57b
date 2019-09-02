class CreateStreetAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :street_addresses do |t|
      t.integer :user_id, foreign_key: true
      t.string :prefecture, null: false
      t.string :city, null: false
      t.integer :postal_code, null: false
      t.string :building_name
      t.string :address, null: false
      t.timestamps
    end
  end
end
