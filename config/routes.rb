Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/quit' => 'customers#quit'
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

  devise_for :admin, :controllers => {
    :sessions => 'admin/sessions'
  }

  devise_for :customers, :controllers => {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
