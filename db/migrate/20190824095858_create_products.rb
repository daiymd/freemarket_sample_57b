class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,     null: false, index: true
      t.integer :price,   null: false
      t.integer :status,  null: false
      t.string  :delivery_price,  null: false
      t.string  :delivery_way, null: false
      t.string  :scheduled, null: false
      t.timestamps
    end
  end
end
