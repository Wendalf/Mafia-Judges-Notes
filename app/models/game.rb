class Game < ActiveRecord::Base
  belongs_to :judge, :class_name => "User"
  has_many :nights
  has_many :game_players
  has_many :players, through: :game_players, :class_name => "User"
  has_many :characters, through: :game_players
  accepts_nested_attributes_for :characters
  accepts_nested_attributes_for :game_players, :reject_if => :all_blank

  enum game_status: [:recruiting, :playing, :over]

  def self.open_games
    where("game_status = ?", 0)
  end

  def characters_attributes=(characters_attributes)
    characters_attributes.values.each do |character_attribute|
      if character_attribute[:name].present?
        self.characters.build(character_attribute)
      end
    end
  end

  def game_players_assigned_character
    self.game_players.where.not(character_id: nil, player_id: nil)
  end

  def game_players_based_on_character(character_id)
    self.game_players_assigned_character.where("character_id = ?", character_id)
  end

  def live_players_can_be_taken_action_by(character)
    live_game_players = self.game_players_assigned_character.where("player_status = ?", 0)
    live_players = []
    live_game_players.each do |game_player|
      if game_player.character != character
        live_players << game_player.player
      end
    end
    live_players
  end


  # def rules(capacity)
  #   case capacity
  #   
  # end



end
