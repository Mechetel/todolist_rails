Rails.application.routes.draw do
  devise_for :users
  get "u/:username" => "public#profile", as: :profile

  get '/projects/:id' => 'projects#destroy'
  get '/tasks/:id' => 'tasks#destroy'

  resources :projects
  resources :tasks

  post '/update_tasks_order/:id' => 'projects#update_tasks_order'

  root to: "public#index"
end
