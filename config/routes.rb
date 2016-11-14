Srv::Application.routes.draw do

  resources :users do
    post :login, :on => :collection
  end
  resources :groups do
    post 'join', :on => :member 
  end
  resources :prompts
  resources :sponsors

  root :to => 'users#index'
end
