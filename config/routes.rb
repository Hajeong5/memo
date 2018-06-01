Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  root 'posts#index'
  resources :posts do
    post 'like', to: 'posts#like', as: :like, on: :member
  end
  
  resources :users, only:[:show] do
    post 'follow', to: 'users#follow', as: :follow, on: :member
  end
  # resources :posts do
  #   resources :comments
  # end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
