Rails.application.routes.draw do
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"

  resources :posts do
    collection do
      get 'search', to: 'posts#search'
    end
  end

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
end