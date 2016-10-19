class Night < ApplicationRecord
  belongs_to :game
  has_many :game_players, through: :game
  has_many :characters, through: :game

  accepts_nested_attributes_for :game_players, :reject_if => :all_blank
end
