class ChannelsController < ApplicationController

  def show
    @channels_name = get_channels_name
    @channel_name = params[:channel]
    response = send_request(REQ_SEARCH_MESSAGES, channel_params)
    @messages = response['messages']
  end

  private

  def channel_params
    params.permit(:channel)
  end

end
