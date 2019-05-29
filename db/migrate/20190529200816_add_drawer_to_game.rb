class AddDrawerToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :drawer_id, :integer
  end
end
