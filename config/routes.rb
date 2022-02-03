Rails.application.routes.draw do

  get '/members', to: 'members#index'
  get '/members/:id', to: "members#show"
  get '/cults', to: 'cults#index'
  get '/cults/:cult_id/members', to: 'cult_members#index'
  #get '/cults/members', to: 
end
