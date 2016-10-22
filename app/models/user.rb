class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :github]

  #as judge
  has_many :games, :foreign_key => "judge_id"
  has_many :players, through: :games 
  
  #as player
  has_many :game_players, :foreign_key => "player_id"
  has_many :joined_games, through: :game_players, :source => "game"
  has_many :characters, through: :game_players, :source => "character" 



  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end      
  end

  def players_character_name(game)
    self.game_players.find_by(game_id: game.id).character.name
  end

  def judging_game
    self.games.find{|game| game.game_status == "recruiting" || game.game_status == "playing"}
  end

  def joined_game
    self.joined_games.find{|joined_game| joined_game.game_status == "recruiting" || joined_game.game_status == "playing"}
  end

  
end
