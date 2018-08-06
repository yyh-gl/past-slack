module MessagesUtil
  include UsersUtil

  def get_messages(keyword=nil)
    response = send_request(REQ_SEARCH_MESSAGES, channel_params)
    messages = response['messages']

    users = get_users_name_with_avatar
    messages.each do |message|
      if message['user'].present?
        id = message['user'].to_s
        message['user'] = users[id]['name']
        message['avatar'] = users[id]['avatar']
      else
        message['user'] = 'unknown'
        message['avatar'] = 'https://lh6.googleusercontent.com/-y-MY2satK-E/AAAAAAAAAAI/AAAAAAAAAJU/ER_hFddBheQ/photo.jpg'
      end
      message['ts'] = Time.at(message['ts'].to_d)
    end
    messages.select! { |message| message['text'].include?(keyword) } if keyword.present?
    messages
  end

end