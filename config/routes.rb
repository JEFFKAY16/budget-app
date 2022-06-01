Rails.application.routes.draw do
  root 'categories#index'

  resources :categories, only: [:index, :show, :new, :create] do
    resources :payments, only: [:index, :new, :create]
  end

end
