Rails.application.routes.draw do
  devise_for :users

  root to: 'currency_pairs#index'

  resources :currency_pairs, only: :index do
    post 'find_pair', on: :member
  end

  namespace :admin do
    match '/', to: 'currency_pairs#edit',   via: :get
    match '/', to: 'currency_pairs#update', via: :patch
  end
end
