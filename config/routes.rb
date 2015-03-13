Rails.application.routes.draw do
  devise_for :users
  resources :posts #creates routes for every CRUD action

  get 'about' => 'welcome#about'
  
    root to: 'welcome#index'
end
