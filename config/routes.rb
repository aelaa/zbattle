Rails.application.routes.draw do
  root to: 'static#main'

  get 'battles' => 'static#battles'
  get 'news' => 'static#news'
  get 'streams' => 'static#streams'

  get 'login' => 'sessions#new'

  resources :users
  resource :session, except: [:edit, :update]

  namespace :admin do
    root to: 'battles#index'

    resources :battles
    resources :news_articles, path: :news
  end
end
