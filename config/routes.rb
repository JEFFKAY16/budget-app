Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'splash#index', as: :unauthenticated_root
    end
  end

  resources :categories, only: [:index, :show, :new, :create] do
    resources :payments, only: [:index, :new, :create]
  end

end
