Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :projects do 
    resources :tasks do 
      member do 
        post :toggle
      end
    end
  end 
  # Defines the root path route ("/")
  root "home#index"
end
