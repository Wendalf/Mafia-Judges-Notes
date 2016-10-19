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
end
