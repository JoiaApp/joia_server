Joia::Application.routes.draw do

  resources :users do
    post :upload, :on => :member
    post :login, :on => :collection
    post :refresh, :on => :member
    get :groups, :on => :member
  end

  resources :groups do
    post 'join', :on => :member 
    post 'invite', :on => :member 
    get 'members', :on => :member
    resources :responses
    resources :prompts
  end

  resources :prompts
  resources :sponsors
  resources :responses

  root :to => 'users#index'
end
