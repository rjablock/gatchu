Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do

    root to: 'homes#top'

    resources :today_words, only: [:index, :show]

    resources :posts, only: [:index, :show]

    resources :questions, only: [:new, :create, :index, :show] do
      resources :bookmarks, only: [:create, :destroy]
      resources :answers, only: [:create] do
        resource :evaluations, only: [:create, :destroy]
      end
    end

    resources :users, only: [:show, :edit, :update] do
      resources :bookmarks, only: [:index]
    end
    get '/users/:id/confirm' => 'users#confirm'
    patch '/users/:id/quit' => 'users#quit'

  end

  namespace :admin do

    get '/' => 'users#index'

    resources :today_words, only: [:new, :create, :index, :edit, :update, :destroy]

    resources :genres, only: [:create, :index, :update]

    resources :posts, only: [:new, :create, :index, :edit, :update, :destroy]

    resources :questions, only: [:index, :show, :destroy] do
      resources :answers, only: [:index, :destroy]
    end

    resources :users, only: [:index, :show, :edit, :update]

  end

end
