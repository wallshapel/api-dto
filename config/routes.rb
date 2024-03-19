# config/routes.rb

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :books do
        get 'details', on: :member
      end
    end
  end
end
