Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'items/:id/merchant', to: 'items#item_merchant', as: 'items_merchant'

      resources :merchants do
        resources :items, only: [:index, :show]
      end
      resources :items
    end
  end
end
