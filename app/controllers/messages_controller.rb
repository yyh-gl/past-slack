class MessagesController < ApplicationController

  def index
    @channels = send_request(REQ_GET_PUBLIC_CHANNELS)
    @users = send_request(REQ_GET_ALL_USERS)
  end

end
