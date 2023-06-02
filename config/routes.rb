Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'questions/index'
    get 'questions/show'
  end
  namespace :admin do
    get 'posts/new'
    get 'posts/index'
    get 'posts/edit'
  end
  namespace :admin do
    get 'today_words/new'
    get 'today_words/index'
    get 'today_words/edit'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/confirm'
  end
  namespace :public do
    get 'questions/new'
    get 'questions/index'
    get 'questions/show'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :public do
    get 'today_words/index'
    get 'today_words/show'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

end
