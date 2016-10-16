class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :capacity
      t.integer :judge_id
      t.integer :game_status, default: 0

      t.timestamps null: false
    end
  end
end
