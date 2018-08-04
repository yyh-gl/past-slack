class MessagesController < ApplicationController

  def index
    @users = send_request(REQ_GET_ALL_USERS)
    puts @users
  end

end
