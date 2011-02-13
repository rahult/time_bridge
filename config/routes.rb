TimeBridge::Application.routes.draw do
  resources :time_logs

  resources :projects do
    resources :stories do
      get 'log',  :on => :member
      get 'stop', :on => :member
    end
  end

  match 'all' => 'stories#all', :as => :all_stories

  devise_for :users

  root :to => 'stories#all'
end
