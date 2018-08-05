Rails.application.routes.draw do
  get 'channels/show'
  root 'messages#index'

  get '/channels/:channel', to: 'channels#show'
end
