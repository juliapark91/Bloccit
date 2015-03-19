Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  
  resources :summaries, only: [:index, :show]

  root to: 'welcome#index'
end
