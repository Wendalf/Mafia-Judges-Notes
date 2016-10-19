module ApplicationHelper
  def current_game
    currently_judged_game = current_user.games.find{|game| game.game_status == "recruiting" || game.game_status == "playing"}
    current_joined_game = current_user.joined_games.find{|game| game.game_status == "recruiting" || game.game_status == "playing"}
    currently_judged_game || current_joined_game
  end
end
