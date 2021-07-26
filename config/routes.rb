Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#new'
  end
  resources :users, :controller => "users" do 
    collection { post :import }
  end
  devise_for :users
  
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  
  root to: 'dashboard#index'
end
