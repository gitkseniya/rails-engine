Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/most_items', to: 'merchants/most_items#index'
      get 'merchants/find', to: 'merchants/search#show'
      get 'items/find_all', to: 'items/search#index'
      get 'items/:id/merchant', to: 'items#item_merchant'



      resources :merchants do
        resources :items, only: [:index, :show]
      end
      resources :items
    end
  end
end
