class CreateAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.integer :poll_id, null: false 
      t.integer :answerer_id, null: false 
      t.string :text, null: false 
      t.timestamps
    end
  end
end
