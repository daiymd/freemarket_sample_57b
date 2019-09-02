class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id, foreign_key: true
      t.integer :seller_id, foreign_key: true
      t.integer :product_id, foreign_key: true
      t.timestamps
    end
  end
end
