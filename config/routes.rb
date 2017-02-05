Rails.application.routes.draw do
  root to: 'static#main'

  get 'battles' => 'static#battles'
  get 'news' => 'static#news'
  get 'streams' => 'static#streams'

  get 'login' => 'sessions#new'

  resources :users
  resource :session, except: [:edit, :update]
end
