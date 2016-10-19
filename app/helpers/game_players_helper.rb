module GamePlayersHelper

  def able_to_assign_character?(game_player)
    game_player.object.has_player? && !game_player.object.has_character?
  end

  def player_name(game_player)
    game_player.object.player.name
  end

end
