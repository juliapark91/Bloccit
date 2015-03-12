Rails.application.routes.draw do
  resources :posts #creates routes for every CRUD action

  get 'about' => 'welcome#about'
  
    root to: 'welcome#index'
end
