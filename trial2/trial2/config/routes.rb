Rails.application.routes.draw do
 
  root to: 'users#index'

  get '/users', to: 'users#index', as: 'users'

  get '/users/new', to: 'users#new', as: 'new_user'

  post '/users', to: 'users#create'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'

  get 'logout', to: 'sessions#destroy'

  post '/sessions', to: 'sessions#create'

  get '/articles', to: 'articles#index'

  get '/articles/new', to: 'articles#new', as: 'new_article'

  post '/articles', to: 'articles#create'



end
