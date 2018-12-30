Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users
    resources :tokens, only: [:create]
    resources :posts
    resources :comments
  end
end
