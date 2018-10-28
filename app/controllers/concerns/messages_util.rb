module MessagesUtil
  include UsersUtil

  def get_messages_by_keyword(keyword=nil)
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

  def get_messages_by_all_params(keyword=nil, channel=nil, user=nil)
    if channel.present? && keyword.blank? && user.blank?
      response = send_request(REQ_SEARCH_MESSAGES, { channel: channel })
    else
      response = send_request(REQ_GET_ALL_MESSAGES)
    end
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
    messages.select! { |message| message['channel_name'] == channel } if channel.present?
    messages.select! { |message| message['user'] == user } if user.present?
    # TODO: 全てのメッセージを取得したときにチャンネルごとの時系列で表示されるのを全体の時系列で表示する
    messages
  end

  def get_last_updated_date
    response = send_request(REQ_GET_UPDATED_DATE)
    DateTime.parse(response['updated_at']).strftime('%Y年%m月%d日 %H時%M分%S秒')
  end

end