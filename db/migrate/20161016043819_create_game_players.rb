class CreateGamePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_players do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :character_id
      t.integer :player_status, default: 0

      t.timestamps null: false
    end
  end
end
