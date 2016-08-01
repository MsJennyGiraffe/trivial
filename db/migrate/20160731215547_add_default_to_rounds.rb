class AddDefaultToRounds < ActiveRecord::Migration[5.0]
  def change
    change_column :rounds, :correct, :integer, default: 0
    change_column :rounds, :out_of, :integer, default: 10
  end
end
