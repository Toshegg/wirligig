api_methods = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do
  root 'welcome#coming_soon'
  
  mount_devise_token_auth_for 'User', at: 'api/auth'
  get 'index', to: 'welcome#index'

  namespace :api do
    resources :universities, only: api_methods
    resources :infos, only: api_methods
    resources :infos_study_languages, only: api_methods
    resources :study_languages, only: api_methods
    resources :language_codes, only: api_methods
    resources :exams, only: api_methods
    resources :graduates, only: api_methods
    resources :courses, only: api_methods
    resources :courses_exams, only: api_methods
    resources :courses_graduates, only: api_methods
    resources :photos, only: api_methods
    resources :countries, only: api_methods
    resources :cities, only: api_methods
   
    resources :users, only: api_methods

    get 'pay', to: 'payments#pay'
    post 'payment_succeed', to: 'payments#payment_succeed'
  end
end
