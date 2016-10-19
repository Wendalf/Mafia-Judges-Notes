module GamesHelper

  def judge?(game)
    game.judge == current_user
  end

  def can_join_game?
    !current_user.joined_games.find{|joined_game| joined_game.game_status == "recruiting" || joined_game.game_status == "playing"}
  end

  def playing_this_game?(game)
    current_user.joined_games.include?(game)
  end

  def player_name(game_player)
    game_player.player.name
  end

  def judge_name(game)
    if game.judge == current_user
      "you"
    else
      game.judge.name
    end
  end

end
