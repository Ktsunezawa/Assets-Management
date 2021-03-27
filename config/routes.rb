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
    resources :fixed_assets do
      collection do
        get 'get_detail/:classification' => 'fixed_assets#get_detail'
        get 'approved_index'
      end
      member do
        patch 'withdrawal'
      end
    end
    resources :classification_details, except: [:show]
    resources :strongpoints, except: [:show, :edit, :update]
  end

  namespace :managers do
    resources :staffs, only: [:index, :destroy]
    resources :fixed_assets, only: [:index, :show] do
      collection do
        get 'approved_index'
      end
      member do
        patch 'allow'
        patch 'remand'
        patch 'erase'
      end
    end
  end
end
