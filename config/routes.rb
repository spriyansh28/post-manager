Rails.application.routes.draw do
  resources :users
  resources :blogs
  get 'pages/home'
  get 'pages/about'
  devise_for :users, path: '', path_names: {sing_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
  	member do
  		get :toggle_status
  	end
  end
  
  root to: 'pages#home'#setting index as homepage
end
