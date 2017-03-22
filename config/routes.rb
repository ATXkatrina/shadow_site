Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :articles

  get 'welcome/index'

  root 'welcome#index'

  get '/anthonytollin', to: 'about#anthonytollin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
