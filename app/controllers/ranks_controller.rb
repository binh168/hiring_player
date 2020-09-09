class RanksController < ApplicationController
  def index
    @game = Game.find_by id: params[:game]

    if @game
      @ranks = @game.rank
      respond_to do |format|
        format.js 
      end
    else
      flash[:danger] = t ".not_found_game" 
      redirect_to root_path
    end
  end
end
