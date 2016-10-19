class GamePlayer < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, :class_name => "User"
  belongs_to :character


  enum player_status: [:live, :dead, :blocked]

  def has_player?
    !!self.player_id
  end

  def has_character?
    !!self.character_id
  end

  def self.players(game_id)
    self.where("game_id = ?", game_id).where.not(player_id: nil)
  end

  def self.no_character(game_id)
    self.where("game_id = ?", game_id).where(character_id: nil)
  end

  def self.players_has_no_character(game_id)
    player(game_id).merge(no_character(game_id))
  end
  
end
