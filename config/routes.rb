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
    get 'new_demo_group', :as => :demo, :on => :collection
    resources :responses
    resources :prompts
    resources :mentions
  end

  resources :prompts
  resources :sponsors
  resources :responses

  root :to => 'users#index'

  #mount Sidekiq::Web, at:'/sidekiq'
end
