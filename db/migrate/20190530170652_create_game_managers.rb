class CreateGameManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_managers do |t|
      t.string :command
      t.timestamps
    end
  end
end
