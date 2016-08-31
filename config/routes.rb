Rails.application.routes.draw do

  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  get 'signup' => 'user#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resources :user
  resources :site_name

  get 'new' => 'site_name#new'
  post 'new' => 'site_name#instantiate'
  get 'wait' => 'site_name#wait'

  get 'instantiate' => 'script_execute#instantiate'
end
