class GamePlayersController < ApplicationController
  before_action :authenticate_user!

  def create
    game = Game.find_by(id: params[:game_id])
    game_player = game.game_players.find_by(player_id: current_user.id)

    if game_player.nil? && (game.players.size < game.capacity)
      new_game_player = game.game_players.create(player_id: current_user.id)
      flash[:notice] = "Successfully joined the game!"
      redirect_to game_path(game)
    elsif game.players.size >= game.capacity
      flash[:alert] = "This game has met its capacity, unable to join. Sorry!"
      redirect_to opengames_path
    end
  end


end