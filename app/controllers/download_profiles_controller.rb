class DownloadProfilesController < ApplicationController
  def index
    export_csv_files = DownloadZipService.new params[:from], params[:to], current_user
    compressed_files = export_csv_files.perform
    compressed_files.rewind
    send_data compressed_files.read, filename: "#{params[:from]}-#{params[:to]}-CSV.zip"
  end
end
