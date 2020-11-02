class OrdersController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_order, :load_order_actionable, only: :show
  
  def index
    @orders = current_user.active_order.map {|a| a.actionable if a.actionable.payment == false}
  end

  def create
    @order = Order.new order_params

    ActiveRecord::Base.transaction do
      if @order.save!
        @order_actionable = current_user.active_order.build receiver_id: params[:user_id], actionable: @order          
        save_order_actionable @order_actionable
      else
        flash[:danger] = t ".danger_order"
        redirect_to request.referrer || root_path
      end
    end
  end

  def show; end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end

  def save_order_actionable object
    if object.save!
      flash[:success] = t ".success_order"
      redirect_to request.referrer
      ActionCable.server.broadcast "notification_channel", type: object.actionable_type,
        receiver: object.receiver_id
    else
      flash[:danger] = t ".danger_order"
      redirect_to request.referrer
    end
  end

  def load_order
    @order = Order.find_by id: params[:id]

    return if @order
    flash[:danger] = t ".not_found_order" 
    redirect_to root_path
  end

  def load_order_actionable
    @order_actionable = SenderRecipient.find_by id: params[:notification]

    return if @order_actionable
    flash[:danger] = t ".not_found_order" 
    redirect_to root_path
  end
end
