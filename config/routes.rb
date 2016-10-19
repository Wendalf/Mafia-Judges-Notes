Rails.application.routes.draw do
  

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "welcome#home"
  get '/about' => 'welcome#about'
  resources :games
  get '/opengames' => 'games#opengames'
  get '/judgedgames' => 'games#judgedgames'
  resources :characters
  resources :game_players, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
