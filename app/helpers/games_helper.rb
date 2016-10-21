module GamesHelper
  
  def judge?(game)
    game.judge == current_user
  end

  def judge_name(game)
    if game.judge == current_user
      "you"
    else
      game.judge.name
    end
  end

  def can_join_game?
    !current_user.joined_games.find{|joined_game| joined_game.game_status == "recruiting" || joined_game.game_status == "playing"}
  end

  def show_join_game?(game)
   (!judge?(game)) && (can_join_game?) && (game.players.size < game.capacity)
  end

  def playing_this_game?(game)
    current_user.joined_games.include?(game)
  end

  def players_joined_game?(game)
    !game.players.nil?
  end

  def judge_can_start_game?(game)
    (game.judge == current_user) && (game.players.size == game.capacity)
  end

  def can_start_night?(game)
    game.judge == current_user
  end


end
