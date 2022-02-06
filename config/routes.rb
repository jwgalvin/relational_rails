Rails.application.routes.draw do

  get '/members', to: 'members#index'
  get '/members/:id', to: "members#show"
  get '/cults', to: 'cults#index'
  get '/cults/new', to: 'cults#new'
  get '/cults/:cult_id/members', to: 'cult_members#index'
  get '/cults/:id', to: 'cults#show'
  post '/cults/new', to: 'cults#create'
  get '/cults/:id/edit', to: 'cults#edit'
  patch '/cults/:id/', to: 'cults#update'
  delete '/cults/:id', to: 'cults#destroy'
end
