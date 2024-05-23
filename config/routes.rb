Rails.application.routes.draw do
  root 'posts#index'
  post '/posts' => 'posts#create'
  post '/reviews' => 'reviews#create'
  get '/posts' => 'posts#create'
end
