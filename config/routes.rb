Rails.application.routes.draw do


  get '/' => "posts#index"

  get 'posts' => "posts#index"

  get 'posts/new'

  get 'posts/:id' => "posts#show"

  get "posts/:id/edit" => "posts#edit"

  post "posts/:id/update" => "posts#update"

  post "posts/:id/destroy" => "posts#destroy"


  post 'posts/create' => "posts#create"



  get 'posts/edit'

  get 'users' => "users#index"

  get 'login' => "users#login_form"

  post 'login' => "users#login"

  post 'logout' => "users#logout"

  get 'signup' => "users#new"

  post 'users/create' => "users#create"


  get 'users/:id' => "users#show"

  get 'users/:id/edit' => "users#edit"

  post "users/:id/update" => "users#update"

  post "users/:id/destroy" => "users#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
