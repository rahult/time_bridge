TimeBridge::Application.routes.draw do
  resources :settings do
    get 'sync', :on => :member
  end

  resources :projects do
    resources :stories do
      get 'log',  :on => :member
      get 'stop', :on => :member
    end
  end

  match 'all' => 'stories#all', :as => :all_stories
  match 'settings' => 'setting#edit', :as => :settings

  devise_for :users

  root :to => 'stories#all'
end
