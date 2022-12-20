Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy]
      resources :bids, only: [:create, :destroy]
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create] do
        #get('users/current', {to: 'users#current'})
        #default api/v1/users/:id/current
        get :current, on: :collection #api/v1/users/current
      end

    end

  end



end
