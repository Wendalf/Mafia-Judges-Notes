class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, only: [:show, :edit, :update, :destroy]
  

  def index
    @games = Game.all
  end

  def opengames
    @games = Game.open_games
  end

  def judgedgames
    @gmaes = current_user.games.find_all{|game| game.game_status == "over"}
  end

  def new
    if current_user.judging_game
      flash[:alert] = "You are already judging this game."
      redirect_to game_path(current_user.judging_game)
    elsif current_user.joined_game
      flash[:alert] = "You've already joined this game."
      redirect_to game_path(current_user.joined_game)
    else
      @game = Game.new
      @game.characters << Character.find_by(name: "Mafia")
    end
  end

  def create
    @game = Game.new(game_params)
    #adding mafia by default
    @game.characters << Character.find_by(name: "Mafia") unless game_params[:character_ids].include?("2")
    
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    if (@game.game_status == "playing") && (!current_user.joined_games.find_by(id: @game.id)) && (current_user != @game.judge)
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end
  
  def edit
    if @game.playing? || @game.over?
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def update
    if @game.judge_id == current_user.id && @game.recruiting?
      @game.update(game_status: "playing")
      @game.update(game_params)
      flash[:notice] = "Game status updated to playing now!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    @game.destroy
    redirect_to root_path
  end

  private

  def find_game
    @game = Game.find_by(id: params[:id])
    if @game.nil?
      flash[:alert] = "Game not found."
      redirect_to root_path
    end
  end

  def game_params
    params.require(:game).permit(:capacity, :judge_id, :game_status, character_ids: [], characters_attributes: [:name, :description, :ability, :ability_effect], game_players: [], game_players_attributes: [:character_id, :id])
  end


end
