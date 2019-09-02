class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :product_id, foreign_key: true
      t.string :image, null: false
      t.timestamps
    end
  end
end
