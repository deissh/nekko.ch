# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/profile'
  get 'user/settings'
  devise_for :admins, path: 'adm'
  devise_for :users, path: 'users'

  root 'anime#index'

  resources :anime, as: 'anime', only: %i[show index]

  scope '/admin' do
    mount RailsAdmin::Engine => '/panel', as: 'rails_admin'
  end
end
