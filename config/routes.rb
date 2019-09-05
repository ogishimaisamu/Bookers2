Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
  devise_for :users
  resources :books, only: [:delete, :edit, :new, :create, :index, :show, :destroy, :update] do
  end
  # For details on the DSL avail
  resources :users, only: [:top, :new, :create, :show, :index, :edit, :update, :destroy] do
  end
end