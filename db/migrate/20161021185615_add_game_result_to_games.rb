class AddGameResultToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :game_result, :integer, :default => 0
  end
end
