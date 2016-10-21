class GamePlayer < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, :class_name => "User"
  belongs_to :character

  def has_player?
    !!self.player_id
  end

  def has_character?
    !!self.character_id
  end

  def self.game_player(game_id, player_id)
    where("game_id = ?", game_id).where("player_id = ?", player_id).first
  end

  def self.alive_game_players(game)
    where("game_id = ?", game.id).where.not(player_id: nil).where("player_alive = ?", true)
  end

  def self.character_alive(game, character)
    where("game_id = ?", game.id).where.not(player_id: nil).where("character_id = ?", character.id).where("player_alive = ?", true)
  end

  def self.alive_mafia_number(game)
    alive_game_players(game).where("character_id = ?", 2).size
  end

  def self.alive_good_people_number(game)
    alive_game_players(game).size - alive_mafia_number(game)
  end

  
end
