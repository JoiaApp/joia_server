Joia::Application.routes.draw do

  resources :users do
    post :login, :on => :collection
    get :groups, :on => :member
  end
  resources :groups do
    post 'join', :on => :member 
    post 'invite', :on => :member 
    resources :responses
    resources :prompts
  end
  resources :prompts
  resources :sponsors

  root :to => 'users#index'
end
