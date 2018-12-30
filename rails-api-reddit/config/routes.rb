Rails.application.routes.draw do
  get 'users/create'
  namespace :api, defaults: { format: :json } do
    resources :users
    resources :tokens, only: [:create]
  end
end
