Rails.application.routes.draw do
  get '/' => 'main#start'
  get '/new_user' => 'users#new'
  post '/new_user' => 'users#new_user'
end