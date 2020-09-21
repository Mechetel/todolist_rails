Rails.application.routes.draw do
  devise_for :users, :sign_out_via => [ :post, :get ]
  get "u/:username" => "public#profile", as: :profile
  root to: "public#index"

  get '/projects/:id' => 'projects#destroy'
  get '/tasks/:id' => 'tasks#destroy'

  resources :projects
  resources :tasks

  post '/update_tasks_order/:id' => 'projects#update_tasks_order'

end
