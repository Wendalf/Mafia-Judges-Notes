class Night < ActiveRecord::Base
  belongs_to :game
  has_many :game_players, through: :game
  has_many :characters, through: :game
  has_many :players, through: :game

  accepts_nested_attributes_for :game_players
end
