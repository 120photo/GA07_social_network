Rails.application.routes.draw do
  get '/' => 'main#start'
  get '/new_user' => 'users#new'
  post '/new_user' => 'users#create'

  #add friend
  get '/add/:id' => 'users#add_friend'
  
  #for login/logout  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #for profile
  get '/profile/:id' => 'profile#show'
  get '/profiles' => 'profile#all'
  get '/profile/:id/edit' => 'profile#edit_profile'
  get '/profile/:id/save' => 'profile#save_changes'
  post '/profile/:id/save' => 'profile#save_changes'

  get '/create_profile' => 'profile#new'
  post '/create_profile' => 'profile#create'

  # comment on wall (profile) 
  get '/posting/:id' => 'posting#new'
  post '/posting/:id' => 'posting#create'
  




end