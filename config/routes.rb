Donate::Application.routes.draw do
  resources :donations


  root :to => "users#show"  

  devise_for :users

  resources :users    
  resources :donations
end
