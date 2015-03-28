Rails.application.routes.draw do
  devise_for :users
    resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] 
  end
  
  resources :posts, only: [] do #This is because we don't want to create any /posts/:id routes, just posts/:post_id/comments
    resources :comments, only: [:destroy, :create, :new]
  end

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
