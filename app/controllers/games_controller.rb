class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, only: [:show, :edit, :update]


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
    @game = Game.new
  end

  def create
    binding.pry
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    
  end
  
  def edit

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

    
    # if current_user.admin? || current_user.vip? || current_user.try(:id) == @post.user_id
    #   @post.update(post_params)
    #   flash[:notice] = "Post updated!"
    # else
    #   flash[:alert] = "Access denied."
    # end
    # redirect_to post_path(@post) 

  end

  def destroy
  end

  private

  def find_game
    @game = Game.find_by(id: params[:id])

  end

  def game_params
    params.require(:game).permit(:capacity, :judge_id, :game_status, character_ids: [], characters_attributes: [:name, :description], game_players: [], game_players_attributes: [:character_id, :id])
  end


end
