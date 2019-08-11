Rails.application.routes.draw do
  devise_for :users, path: 'users'

  resources :anime, as: 'anime'
  # get 'anime/:id' => 'anime#show', as: 'anime'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
