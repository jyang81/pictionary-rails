class AddPayloadToGameManagers < ActiveRecord::Migration[5.2]
  def change
    add_column :game_managers, :payload, :string, array: true, default: []
  end
end
