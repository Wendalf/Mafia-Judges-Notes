Rails.application.routes.draw do
  
  resources :characters
  resources :game_players
  resources :games
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "welcome#home"
  get '/about' => 'welcome#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
