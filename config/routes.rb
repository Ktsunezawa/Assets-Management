Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :managers, controllers: {
    sessions: 'managers/sessions',
    passwords: 'managers/passwords',
    registrations: 'managers/registrations',
  }

  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions',
    passwords: 'staffs/passwords',
    registrations: 'staffs/registrations',
  }

  namespace :staffs do
    resources :staffs, only: [:edit, :update]
    resources :fixed_assets, except: [:edit, :destroy]
  end

  namespace :managers do
    resources :staffs, only: [:index, :destroy]
    resources :fixed_assets, only: [:index, :show, :destroy]
    end
end
