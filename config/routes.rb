Rails.application.routes.draw do
  root 'messages#index'

  get 'channels/:channel', to: 'channels#show'
  get 'search', to: 'messages#show'
end
