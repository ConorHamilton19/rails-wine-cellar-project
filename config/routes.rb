Rails.application.routes.draw do
  resources :types do
    resources :wines, only: [:show, :new]
  end
  resources :wines
  resources :users

  root 'welcome#welcome'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
