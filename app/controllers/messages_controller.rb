class MessagesController < ApplicationController

  def index
    @channels_name = get_channels_name
    @users_name = get_users_name
  end

end
