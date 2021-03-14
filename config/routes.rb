Rails.application.routes.draw do

  namespace :staffs do
    get 'classifications/new'
    get 'classifications/index'
    get 'classifications/edit'
  end

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
    resources :fixed_assets, except: [:edit, :destroy] do
      collection do
        get 'fixed_assets/get_detail/:classification' => 'fixed_assets#get_detail'
      end
    end
    resources :post_images, only: [:create, :destroy]
    resources :classification_details, except: [:show]
    resources :bases, except: [:show, :edit, :update]
  end

  namespace :managers do
    resources :staffs, only: [:index, :destroy]
    resources :fixed_assets, only: [:index, :show, :destroy]
  end
end
