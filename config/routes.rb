Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :merchants
  # resources :items

  namespace :api do
    namespace :v1 do
      resources :merchants
    end
  end

end
