class Character < ActiveRecord::Base
  has_many :game_players
  has_many :games, through: :game_players
  has_many :players, through: :game_players, :class_name => "User"

  validates :name, uniqueness: {message: "Character Exist!"}

  #need to implement the error and error message on CSS#


  def kill?
    self.ability_effect < 0
  end

  def heal?
    self.ability_effect > 0
  end

  def check
    self.ability_effect == 0
  end
end
