Rails.application.routes.draw do
  devise_for :customers, :skip => [:password, :registrations], :controllers => {
    :sessions => 'public/sessions'
  }

  devise_scope :customers do
    get 'customers/sign_up' => 'public/registrations#new'
    post 'customers' => 'public/registrations#create'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    get 'customers/update' => 'customers#update'
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

  devise_for :admin, :skip => [:registrations, :password], :controllers => {
    :sessions => 'admin/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
