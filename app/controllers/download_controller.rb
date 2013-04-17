class DownloadController < ApplicationController
  def index
    @file = params[:filename]
    send_file File.join("files", @file) 
  end
end
