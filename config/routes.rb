# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/profile'
  get 'user/settings'
  devise_for :admins, path: 'adm'
  devise_for :users, path: 'users'

  root 'anime#index'

  # anime search and view
  resources :anime, as: 'anime', only: %i[show index]

  # JSON Api
  scope '/api/v1', defaults: { format: :json } do
    # get and save current progress by user
    scope '/anime' do
      get '/:id/progress', to: 'anime#progress'
      post '/:id/progress', to: 'anime#add_progress'
    end
  end

  scope '/admin' do
    mount RailsAdmin::Engine => '/panel', as: 'rails_admin'
  end
end
