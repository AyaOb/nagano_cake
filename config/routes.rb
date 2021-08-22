Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/update' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/quit' => 'customers#quit'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
  end

  devise_for :customers, :skip => [:password ], :controllers => {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

  devise_for :admin, :skip => [:registrations, :password], :controllers => {
    :sessions => 'admin/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
