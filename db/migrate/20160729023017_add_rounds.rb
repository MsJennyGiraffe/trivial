class AddRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :correct
      t.integer :out_of
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
