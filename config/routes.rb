TimeBridge::Application.routes.draw do
  resources :projects do
    resources :stories
  end

  match 'all' => 'stories#all', :as => :all_stories

  devise_for :users

  root :to => 'stories#all'
end
