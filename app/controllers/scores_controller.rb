class ScoresController < ApplicationController
  before_action :set_game_and_players
  respond_to :html

  def new
    @scores = @game.players.map{|p| p.scores.build(value: 0) }
  end

  def create
    scores_params = params[:scores]
    @scores = @game.players.map do |p|
      p.scores.build(value: scores_params[p.name])
    end

    if @scores.all? {|s| s.valid?}
      @scores.each(&:save)
      redirect_to @game
    else
      render :new
    end
  end
  private
  def set_game_and_players
    @game = Game.find(params[:game_id])
    @players = @game.players
  end
end
