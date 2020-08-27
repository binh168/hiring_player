class MessengersController < ApplicationController
  before_action :load_user, only: %i(index)
  skip_before_action :verify_authenticity_token

  def index
    @messengers = SenderRecipient.messenger.find_messenger(current_user.id, params[:user_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @message = Messenger.new message: params[:message]

    ActiveRecord::Base.transaction do
      if @message.save!
        @message_actionable = current_user.active_messenger.build receiver_id: params[:receiver],
          actionable: @message
        save_message_actionable @message_actionable
      else
        flash.now[:danger] = t ".danger"
        redirect_to request.referrer || root_path
      end
    end
  end

  def show; end

  private

  def save_message_actionable object
    if object.save!
      mine = ApplicationController.render(
        partial: "messengers/mine",
        locals: {messenger: object}
      )

      ActionCable.server.broadcast "room_channel_#{params[:receiver]}",
        mine: mine, message_actionable: object
    else
      flash.now[:danger] = t ".danger"
      redirect_to request.referrer
    end
  end

  def load_user
    @user = User.find_by id: params[:user_id]

    return if @user
    flash[:danger] = t ".not_found_user" 
    redirect_to root_path
  end
end
