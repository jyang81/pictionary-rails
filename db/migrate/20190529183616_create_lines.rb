class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :color
      t.integer :strokeWidth

      t.timestamps
    end
  end
end
