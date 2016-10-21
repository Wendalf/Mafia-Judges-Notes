class CreateNights < ActiveRecord::Migration[5.0]
  def change
    create_table :nights do |t|
      t.integer :game_id
      t.string :logs
      t.string :notes

      t.timestamps
    end
  end
end
