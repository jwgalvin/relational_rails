Rails.application.routes.draw do

  get '/members', to: 'members#index'
  get '/members/:id', to: "members#show"
  #get '/cults/:id', to: 'cults#show'

end
