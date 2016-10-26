class NightsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, only: [:new, :create, :show, :update]
  before_action :find_night, only: [:show, :update]
  before_action :game_end?, only: [:show, :new]

  def index
  end

  def new
    
    if @game.judge_id == current_user.id && @game.playing?
      @night = Night.new(game_id: params[:game_id])
    else
      flash[:alert] = "Access denied."
      redirect_to game_path(@game)
    end

  end

  def create
    @night = Night.new(game_id: @game.id, logs: "", notes: "")

    got_killed = []

    params[:night_events].each do |character_name, player_id|
      character = Character.find_by(name: character_name)
      game_player = GamePlayer.game_player(@game.id, player_id)
      
      @night.logs << "#{character_name} #{character.ability}ed #{User.find(player_id).name}.<br>"

      if character.kill?
        game_player.assign_attributes(player_alive: false)
        got_killed << game_player
      elsif character.heal? && got_killed.include?(game_player)
        got_killed.delete(game_player)
      end
    end
    
    got_killed.each do |game_player|
      game_player.save
    end

    if got_killed.empty?
      @night.notes << "No one got killed last night.<br>"
    else
      got_killed.each do |game_player|
        @night.notes << "#{game_player.player.name} got killed last night.<br>" 
      end   
    end

    @night.save
    redirect_to game_night_path(@game, @game.nights.size)
  
  end

  def show
    if (@game.judge_id != current_user.id) && @game.playing?
      flash[:alert] = "Access denied."
      redirect_to game_path(@game)
    end
  end

  def update

    player_id = params[:day_event][:executed]

    if player_id == ""
      @night.notes << "No body got executed by votes.<br>"
    else
      game_player = GamePlayer.game_player(@game.id, player_id)
      game_player.update(player_alive: false)

      @night.notes << "#{game_player.player.name} has been executed by votes.<br>"
    end
    
    @night.save
    redirect_to new_game_night_path(@game)
  end

  def destroy
  end

  private

  def find_game
    @game = Game.find_by(id: params[:game_id])
    if @game.nil?
      flash[:alert] = "Game not found."
      redirect_to root_path
    end
  end

  def find_night
    # @night = @game.nights.find_by(id: params[:id])
    @night = @game.nights.last
  end

  def game_end?
    if GamePlayer.alive_mafia_number(@game) == 0
      @game.update(game_status: "over", game_result: "good_people")
      flash[:notice] = "Game Over || Good People Win!"
      redirect_to game_path(@game)
    elsif GamePlayer.alive_mafia_number(@game) >= GamePlayer.alive_good_people_number(@game)
      @game.update(game_status: "over", game_result: "mafia")
      flash[:notice] = "Game Over || Mafia Win!"
      redirect_to game_path(@game)
    end
  end

end
