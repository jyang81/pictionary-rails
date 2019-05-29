class AddWordToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :word, :string
  end
end
