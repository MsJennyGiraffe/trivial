class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :text
      t.belongs_to :question, index: true, foreign_key: true
    end
  end
end
