class MessagesController < ApplicationController
  protect_from_forgery prepend: true, with: :exception


  def index
    @channels_name = get_channels_name
    @users_name = get_users_name
  end

  def show
    @channels_name = get_channels_name
    puts 'asdf'
    puts params
    puts 'asdf'
  end

end
