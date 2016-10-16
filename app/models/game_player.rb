class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player, :class_name => "User"
  belongs_to :character

  enum player_status: [:live, :dead, :blocked]

end
