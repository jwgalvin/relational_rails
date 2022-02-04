Rails.application.routes.draw do

  #Joes work
  get '/members', to: 'members#index'
  get '/members/:id', to: "members#show"
  get '/cults', to: 'cults#index'
  get '/cults/:cult_id/members', to: 'cult_members#index'
  #get '/cults/members', to:

  #Ians work songs = ferret cage , artist = ferret
  get '/ferret_cages', to: 'ferret_cages#index'
end
