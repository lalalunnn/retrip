Rails.application.routes.draw do
  get 'users' => 'users#show', as: "users_show"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles

  root 'articles#index'
end
