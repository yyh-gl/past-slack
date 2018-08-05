class MessagesController < ApplicationController

  def index
    @search_form_name = 'メッセージ'
    @channels_name = get_channels_name
    @users_name = get_users_name
  end

end
