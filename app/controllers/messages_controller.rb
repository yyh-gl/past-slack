class MessagesController < ApplicationController
  protect_from_forgery prepend: true, with: :exception
  before_action :validate_params, only: :show

  def index
    @channels_name = get_channels_name
    @users_name = get_users_name
  end

  def show
    # TODO: 検索結果画面に遷移しても検索ができるようにする
    @channel_detail_page = false
    @channels_name = get_channels_name
    @channel_name = params[:channel]
    @user_name = params[:user]
    @user = params[:user]
    @keyword = params[:keyword]
    @messages = get_messages_by_all_params(params[:keyword], params[:channel], params[:user])
    @last_updated_date = get_last_updated_date
  end

  private

  def validate_params
    params[:channel] = nil if params[:channel] == 'No Select'
    params[:user] = nil if params[:user] == 'No Select'
  end

end
