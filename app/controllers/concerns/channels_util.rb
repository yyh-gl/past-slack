module ChannelsUtil

  def get_channels_name
    channels_name = []
    response = send_request(REQ_GET_PUBLIC_CHANNELS)
    if response['ok']
      response['channels'].each do |channel|
        channels_name << channel['name']
      end
      channels_name.sort!
    end
  end

end