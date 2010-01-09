ActionController::Routing::Routes.draw do |map|
  # Jammit
  Jammit::Routes.draw(map)

  # Content
  map.resources :users, :except => :destroy
  map.resources :projects, :meetings, :only => :index

  # Login
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.register 'register', :controller => 'users', :action => 'new'
  
  map.resource :user_session, :as => 'session'
  map.resource :account, :controller => 'users'

  # Home
  map.root :controller => 'home', :action => 'index'
end

