class RatingsController < ApplicationController
  before_action :logged_in_user, :new_rating, only: :create

  def create
    if @rating.save
      @rating_actionable = current_user.active_rating.build receiver_id: params[:user_id], actionable: @rating

      save_rating_actionable @rating_actionable
    else
      flash.now[:danger] = t ".danger_rating"
      redirect_to request.referrer || root_path
    end
  end

  private

  def ratings_params
    params.permit Rating::RATING_PARAMS
  end

  def new_rating
    @rating = Rating.new ratings_params
  end

  def save_rating_actionable object
    if object.save
      ActionCable.server.broadcast "notification_channel", type: object.actionable_type,
        receiver: object.receiver_id
      redirect_to "ratings/show"
    else
      flash.now[:danger] = t ".danger_rating"
      redirect_to request.referrer || root_path
    end
  end
end
