Rails.application.routes.draw do


  get '/wines/popular', to: 'wines#popular', as: 'popular'
  resources :types do
    resources :wines, only: [:show, :new]
  end
  resources :wines
  resources :users
  resources :user_wines

  root 'welcome#welcome'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  get '/auth/github/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
