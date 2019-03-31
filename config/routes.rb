Rails.application.routes.draw do
  devise_for :users

  root to: 'currency_pairs#index'

  resources :currency_pairs, only: :index

  post 'find_pair', to: 'currency_pairs#find_pair'

  namespace :admin do
    match '/', to: 'currency_pairs#edit',   via: :get
    match '/', to: 'currency_pairs#update', via: :patch
  end
end
