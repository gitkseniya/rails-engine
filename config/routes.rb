Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :merchants do
        resources :items, only: [:index, :show]
      end
      resources :items


      get '/merchants/find', to: 'merchants#find'
      get '/merchants/find_all', to: 'merchants#find_all'
      get '/items/find', to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
    end
  end
end
