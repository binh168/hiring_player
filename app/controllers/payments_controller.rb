class PaymentsController < ApplicationController
  before_action :find_order, only: %i(fee_payment)

  def fee_payment
    uri = "https://mtf.onepay.vn/onecomm-pay/vpc.op?"
    url_payment = {
      vpc_Version: ENV["VPC_VERSION"],
      vpc_Currency: ENV["VPC_CURRENCY"],
      vpc_Merchant: ENV["VPC_MERCHANT"],
      vpc_AccessCode: ENV["VPC_ACCESSCODE"],
      vpc_SecureHash: "8cba701bb4d7f80bc2f9cf382ff69c48c26329c5600ceafc8e8cf7d6c14aab8d",
      vpc_Command: ENV["VPC_COMMAND"],
      vpc_Locale: ENV["VPC_LOCALE"],
      vpc_ReturnURL: "http://localhost:3000/orders",
      vpc_MerchTxnRef: params[:id],
      vpc_OrderInfo: "Payment",
      vpc_Amount: (params[:cost].to_i * 100).to_s,
      # AgainLink: "http://localhost:3000/orders",
      vpc_TicketNo: "210.245.1.9"
    }
    # vpc_AccessCode=D67342C2&vpc_Amount=5000000&vpc_Command=pay&vpc_Currency=VND&vpc_Locale=en&vpc_MerchTxnRef=1&vpc_Merchant=ONEPAY&vpc_OrderInfo=Payment&vpc_ReturnURL=http%3A%2F%2Flocalhost%3A3000%2Forders&vpc_SecureHash=8cba701bb4d7f80bc2f9cf382ff69c48c26329c5600ceafc8e8cf7d6c14aab8d&vpc_TicketNo=210.245.1.9&vpc_Version=2
    # vpc_SecureHash=5c689d420cc89ef764e0990b4c0517f328e13cb72d11ba5ebddb1120a2486959

  # binding.pry
  
    redirect_to uri + url_payment.to_query
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]

    return if @order
    flash[:danger] = t ".not_found_player" 
    redirect_to root_path
  end
end
