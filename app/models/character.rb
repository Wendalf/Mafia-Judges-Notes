class Character < ActiveRecord::Base
  has_many :game_players
  has_many :games, through: :game_players
  has_many :players, through: :game_players, :class_name => "User"

  validates_uniqueness_of :name
  #need to implement the error and error message on CSS#

end
