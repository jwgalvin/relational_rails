Rails.application.routes.draw do

  #Joes work
  get '/members', to: 'members#index'
  get '/cults', to: 'cults#index'
  get '/cults/:id/members', to: 'cult_members#index'
  get '/members/:id', to: 'members#show'
  get '/cults/new', to: 'cults#new'
  get '/cults/:id', to: 'cults#show'

  post '/cults', to: 'cults#create'
  get '/cults/:id/members/new', to: 'cult_members#new'
  post '/cults/:id/new', to: 'cult_members#create'

  get '/cults/:id/edit', to: 'cults#edit'
  patch '/cults/:id', to: 'cults#update'
  get '/members/:id/edit', to: 'members#edit'
  patch '/members/:id/edit', to: 'members#update'


  delete '/cults/:id', to: 'cults#destroy'
  delete '/members/:id', to: 'members#destroy'

  get '/cages', to: 'cages#index'
  get '/cages/:id', to: 'cages#show'
  get '/ferrets', to: 'ferrets#index'
  get '/ferrets/:id', to: 'ferrets#show'
  get '/cages/:cage_id/ferrets', to: 'ferret_cages#index'
end
