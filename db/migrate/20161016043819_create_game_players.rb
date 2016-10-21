class CreateGamePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_players do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :character_id
      t.boolean :player_alive, null: false, default: true

      t.timestamps null: false
    end
  end
end
