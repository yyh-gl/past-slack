module UsersUtil

  def get_users_name
    users_name = []
    response = send_request(REQ_GET_ALL_USERS)
    puts 'asdf'
    puts response
    puts 'asdf'
    if response['ok']
      response['members'].each do |user|
        users_name << user['name']
      end
      users_name.sort
    end
  end

  def get_users_name_with_id
    users_name = {}
    response = send_request(REQ_GET_ALL_USERS)
    if response['ok']
      response['members'].each do |user|
        users_name[user['id']] = user['name']
      end
      users_name.sort_by { |_, v| v }
    end
  end

  def get_users_name_with_avatar
    users = {}
    response = send_request(REQ_GET_ALL_USERS)
    if response['ok']
      response['members'].each do |user|
        users[user['id']] = {}
        users[user['id']]['name'] = user['name']
        users[user['id']]['avatar'] = user['profile']['image_32']
      end
    end
    users
  end

end