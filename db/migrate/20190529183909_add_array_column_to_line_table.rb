class AddArrayColumnToLineTable < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :coordinates, :integer, array: true, default: []
  end
end
