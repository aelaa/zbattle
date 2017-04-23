Rails.application.routes.draw do

  root to: 'static#main'

  get 'news' => 'static#news'
  get 'streams' => 'static#streams'
  get 'faq' => 'static#faq'

  get 'login' => 'sessions#new'

  resources :users
  resource :session, except: [:edit, :update]

  namespace :admin do
    root to: 'battles#index'

    resources :battles
    resources :news_articles, path: :news
    resources :battle_works
  end

  namespace :api do
    resources :battle_works, only: :create
  end

  resources :battles, only: [:index, :show]
end
