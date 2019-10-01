Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    resources :list_items, except: [:index, :show]
  end

  root 'home#index'
end
