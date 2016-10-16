class Game < ApplicationRecord
  belongs_to :judge, :class_name => "User"
  has_many :game_players
  has_many :players, through: :game_players, :class_name => "User"
  has_many :characters, through: :game_players

  enum game_status: [:recruiting, :playing, :over]

end
