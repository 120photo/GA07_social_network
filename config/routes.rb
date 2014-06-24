Rails.application.routes.draw do
  get '/' => 'main#start'
  get '/new_user' => 'users#new'
  post '/new_user' => 'users#create'
  
  #for login/logout  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #for profile
  get '/profile/:id' => 'profile#index'
  get '/create_profile' => 'profile#create'


end