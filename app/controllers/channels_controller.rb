class ChannelsController < ApplicationController

  def show
    @channel_detail_page = true
    @channels_name = get_channels_name
    @channel_name = params[:channel]
    @users_name = get_users_name
    @messages = get_messages_by_keyword(params[:keyword])
    @keyword = params[:keyword]
    @last_updated_date = get_last_updated_date
  end

  private

  def channel_params
    params.permit(:channel)
  end

end
