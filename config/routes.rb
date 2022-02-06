Rails.application.routes.draw do

  get '/members', to: 'members#index'
  get '/members/:id', to: "members#show"
  get '/cults', to: 'cults#index'
  get '/cults/new', to: 'cults#new'
  get '/cults/:id/members', to: 'cult_members#index'
  get '/cults/:id', to: 'cults#show'
  get 'cults/new', to: 'cults#new'
  post '/cults', to: 'cults#create'
  get '/cults/:id/edit', to: 'cults#edit'
  patch '/cults/:id/', to: 'cults#update'
  get '/cults/:id/members/new', to: 'cult_members#new'
  post '/cults/:id/new', to: 'cult_members#create'
  delete '/cults/:id', to: 'cults#destroy'
end
