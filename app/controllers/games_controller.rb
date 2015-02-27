class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @games = Game.all
  end

  def show
    @players = @game.players
    @sums = @game.scores.group(:player_id).sum(:value)
    @scores = @game.scores
      .order(created_at: :desc)
      .each_slice(@players.count)
      .map{|s| s.map{|t| [t.player_id, t]}.to_h}
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.create
    @game.update(game_params)

    respond_with(@game)
  end

  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:player_names)
    end
end
