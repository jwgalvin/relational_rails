Rails.application.routes.draw do

  #Joes work
  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'
  get '/cults', to: 'cults#index'
  get '/cults/:cult_id/members', to: 'cult_members#index'
  get '/cults/:id', to: 'cults#show'
  #get '/cults/members', to:

  #Ians work
  get '/cages', to: 'cages#index'
  get '/cages/:id', to: 'cages#show'
  get '/ferrets', to: 'ferrets#index'
  get '/ferrets/:id', to: 'ferrets#show'
  get '/cages/:cage_id/ferrets', to: 'ferret_cages#index'
end
