require "csv"

class DownloadZipService
  def initialize from, to, current_user
    @from = from
    @to = to
    @user = current_user
  end

  def perform
    Zip::OutputStream.write_buffer(::StringIO.new('')) do |zipfile|
      get_list_messengers_csv zipfile

      get_list_orders_csv zipfile
    end
  end

  private

  def get_list_messengers_csv zipfile
    zipfile.put_next_entry "messengers-#{@from}-#{@to}.csv"

    @messages = @user.active_messenger.order("created_at DESC")
      .find_in_time @from, @to

    attributes = %w{receiver messenger created_at}

    csv = CSV.generate(headers: true) do |csv|
      csv << attributes

      @messages.each do |actionable|
        csv << [actionable.receiver.name, actionable.actionable.message, actionable.created_at]
      end
    end

    zipfile.print csv
  end

  def get_list_orders_csv zipfile
    zipfile.put_next_entry "orders-#{@from}-#{@to}.csv"
    @orders = @user.active_order.find_in_time @from, @to

    attributes = %w{receiver cost rental_period created_at}

    csv = CSV.generate(headers: true) do |csv|
      csv << attributes

      @orders.each do |actionable|
        csv << [actionable.receiver.name, actionable.actionable.cost, 
          actionable.actionable.rental_period, actionable.created_at]
      end
    end

    zipfile.print csv
  end
end
