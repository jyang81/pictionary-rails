class AddActiveUsersToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :users, :string, array: true, default: []
  end
end
