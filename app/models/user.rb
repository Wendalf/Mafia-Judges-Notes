class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :github]

  #as judge
  has_many :games, :foreign_key => 'judge_id'
  has_many :players, through: :games 
  
  #as player
  has_many :game_players, :foreign_key => "player_id"
  has_many :joined_games, through: :game_players, :source =>"game"



  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end      
  end
  
end
