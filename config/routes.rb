Rails.application.routes.draw do
  devise_for :users
  
  root to: 'organizations#index'
  get ':id', to: 'organizations#show', as: 'organization'
  get ':organization_id/tickets/:id', to: 'tickets#show', as: 'ticket'
  namespace :auth do
  end
end