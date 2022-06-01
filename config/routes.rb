Rails.application.routes.draw do
  root 'categories#index'

  resources :categories, only: [:index, :show] do
    resources :payments, only: [:index]
  end

end
