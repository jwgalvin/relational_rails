Rails.application.routes.draw do

  get '/members', to: 'members#index'
  #get '/cults/:id', to: 'cults#show'

end
