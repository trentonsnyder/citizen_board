Rails.application.routes.draw do
  devise_for :users
  
  root to: 'organizations#index'
  get ':id', to: 'organizations#show', as: 'organization'
  get ':organization_id/tickets/:id', to: 'tickets#show', as: 'ticket'
  namespace :auth do
    resources :organizations, only: [:show]
    resources :pools, only: [:show, :new, :create] do
      resources :lanes do
        member do
          post 'move_left'
          post 'move_right'
        end
      end
      resources :tickets do
        member do
          post 'move_left'
          post 'move_right'
        end
      end
    end
  end
end