Rails.application.routes.draw do
  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Clearance.configure do |config|
  config.routes = false
end

resources :users, only: [:update, :show, :edit, :index, :destroy]
resources :listings

# get '/users/:id', to: 'users#show',  as: 'user'

# get '/users/:id/edit', to: 'users#edit',  as: 'edit_user'

# get '/users/index'

root 'users#index'

get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
