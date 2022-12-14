Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/about', to: "pages#about"

  resources :topics do
    resources :questions, only: [:new, :create]
  end
end
