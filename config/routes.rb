Rails.application.routes.draw do

  get 'guests/index'

  get 'guests/new'

  get 'guests/show'

  get 'guests/edit'

  resources :parties do
    resources :guests
  end

  get 'party' => 'party#show'
  
  root to: 'party#index'
end
