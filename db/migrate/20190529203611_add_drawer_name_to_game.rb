class AddDrawerNameToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :drawer_name, :string
  end
end
