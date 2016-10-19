class NightsController < ApplicationController

  def index
  end

  def new
    @game = Game.find(params[:game_id])
    if @game.judge_id == current_user.id && @game.playing?
      @night = Night.new(game_id: params[:game_id])
    else
      flash[:alert] = "Access denied."
      redirect_to game_path(@game)
    end
    

  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
