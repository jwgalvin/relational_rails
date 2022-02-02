Rails.application.routes.draw do

  get '/cults', to: 'cults#index'
  get '/cults/:id', to: 'cults#show'
end
