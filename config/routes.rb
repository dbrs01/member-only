Rails.application.routes.draw do
  resources :members do
    resources :posts, module:  :members
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
