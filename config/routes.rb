Rails.application.routes.draw do
  resources :types
  resources :wines
  resources :users

  root 'welcome#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
