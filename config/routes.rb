Rails.application.routes.draw do
  get '/' => 'main#start'
  get '/new_user' => 'users#new'
  post '/new_user' => 'users#new_user'
  
  #for login/logout  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end