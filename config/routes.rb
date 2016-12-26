Rails.application.routes.draw do
  resources :locations
  devise_scope :user do
    get 'users', to: 'devise/registrations#new'
  end

  devise_for :users

  resources :users, only: [:show]
  resources :articles, only: [:index, :new, :create, :show]

  post 'articles/:article_id' => 'favorite_articles#create', as: 'like'
  delete 'articles/:article_id' => 'favorite_articles#destroy', as: 'unlike'

  root 'articles#index'
end
