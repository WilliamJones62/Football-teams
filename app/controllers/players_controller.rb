class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
    @team = @player.team
    @games = @team.games.all
  end
end
