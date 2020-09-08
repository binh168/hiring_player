class PlayersController < ApplicationController
  before_action :find_player, only: %i(edit update destroy)

  def index
    @players = current_user.players

    return if @players
    flash[:danger] = t ".not_found_player_profile" 
    redirect_to root_path
  end
  
  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.new player_params

    if @player.save
      flash[:success] = t ".success_create"
    else
      flash[:danger] = t ".danger_create" 
    end
    redirect_to players_path
  end

  def edit; end

  def update
    if @player.update player_params
      flash[:success] = t ".success_update"
    else
      flash[:danger] = t ".danger_update"
    end
    redirect_to players_path
  end
  
  def destroy
    @player.destroy

    if @player.destroyed?
      flash[:success] = t ".success_destroy_player"
    else
      flash[:danger] = t ".danger_destroy_player"
    end
    redirect_to request.referrer
  end

  private

  def player_params
    params.require(:player).permit Player::PLAYER_PARAMS
  end

  def find_player
    @player = current_user.players.find_by id: params[:id]

    return if @player
    flash[:danger] = t ".not_found_player" 
    redirect_to root_path
  end
end
