Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
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
