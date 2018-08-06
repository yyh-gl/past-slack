class ChannelsController < ApplicationController

  def show
    @channels_name = get_channels_name
    @channel_name = params[:channel]
    @users_name = get_users_name
    @messages = get_messages(params[:keyword])
    @keyword = params[:keyword]
  end

  private

  def channel_params
    params.permit(:channel)
  end

end
