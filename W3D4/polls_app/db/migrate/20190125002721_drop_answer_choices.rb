class DropAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    drop_table :answer_choices
  end
end
