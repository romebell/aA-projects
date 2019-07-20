class AddBodyToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :body, :string
  end
end
