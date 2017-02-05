Rails.application.routes.draw do
  root to: 'static#main'

  get 'battles' => 'static#battles'
  get 'news' => 'static#news'
  get 'streams' => 'static#streams'
end
