Rails.application.routes.draw do
  devise_for :admins, path: 'adm'
  devise_for :users, path: 'users'

  resources :anime, as: 'anime'

  scope '/admin' do
    mount RailsAdmin::Engine => '/panel', as: 'rails_admin'
  end
end
