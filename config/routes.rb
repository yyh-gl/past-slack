Rails.application.routes.draw do
  root 'messages#index'

  get 'channels/:channel', to: 'channels#show'
  post 'search', to: 'messages#show'
end
