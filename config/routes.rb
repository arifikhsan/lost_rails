# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'categories/index'
      get 'categories/show'
    end
  end
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  mount RailsAdmin::Engine => '/secretroom', as: 'rails_admin'
  devise_for :users
  root to: 'welcome#index'
  namespace :api, defaults: { format: :json } do
    post 'login', to: 'auth#login'
    delete 'logout', to: 'auth#logout'
    post 'register', to: 'auth#register'
    get 'wakeup', to: 'misc#wakeup'
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
    namespace :v1 do
      post 'signin_from_google', to: 'auth#signin_from_google'
      get 'me', to: 'users#me'
      get 'items/mine', to: 'items#mine'
      resources :items
      resources :user_details
      resources :categories
    end
  end
end

# http://localhost:3000/api/v1/auth/google_oauth2/callback
# http://localhost:3000/api/v1/auth/google_oauth2
