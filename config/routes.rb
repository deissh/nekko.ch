# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'adm'
  devise_for :users, path: 'users'

  root 'anime#index'

  # anime search and view
  resources :anime, as: 'anime', only: %i[show index]

  # user
  resources :user, as: 'user', only: %i[show]
    
  scope '/help' do
    # etc
    get 'page/privacy'
    get 'page/copyright'
    get 'page/rules'
    get 'page/about'
  end

  # JSON Api
  scope '/api/v1', defaults: { format: :json } do
    # get and save current progress by user
    scope '/anime' do
      get '/:id/progress', to: 'anime#progress'
      post '/:id/progress', to: 'anime#add_progress'

      get '/:id/status', to: 'anime#get_status'
      post '/:id/status', to: 'anime#change_status'
    end
  end

  scope '/admin' do
    mount RailsAdmin::Engine => '/panel', as: 'rails_admin'
  end
end
