module UsersUtil

  def get_users_name
    users_name = []
    response = send_request(REQ_GET_ALL_USERS)
    if response['ok']
      response['members'].each do |user|
        users_name << user['name']
      end
      users_name.sort!
    end
  end

end