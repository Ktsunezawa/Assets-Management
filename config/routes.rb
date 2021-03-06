Rails.application.routes.draw do


  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }

  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }

  namespace :staffs, path: :staffs do
    resource :staffs, only: [:edit, :update]
  end

  namespace :managers do
    resources :staffs, only: [:index, :destroy]
  end
end
