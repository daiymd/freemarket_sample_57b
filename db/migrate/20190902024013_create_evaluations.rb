class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :user_id, foreign_key: true
      t.integer :status, null: false
      t.timestamps
    end
  end
end
