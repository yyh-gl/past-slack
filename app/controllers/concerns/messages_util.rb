module MessagesUtil

  def get_messages(keyword=nil)
    response = send_request(REQ_SEARCH_MESSAGES, channel_params)
    messages = response['messages']
    messages.each do |message|
      message['ts'] = Time.at(message['ts'].to_d)
    end
    messages.select! { |message| message['text'].include?(keyword) } if keyword.present?
    messages
  end

end