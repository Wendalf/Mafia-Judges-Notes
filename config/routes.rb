Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }
  root to: "welcome#home"
  get '/about' => 'welcome#about'
  resources :games do 
    resources :nights, only: [:index, :new, :create, :show, :update, :destroy]
  end
  get '/opengames' => 'games#opengames'
  get '/judgedgames' => 'games#judgedgames'
  resources :characters, only: [:index, :show]
  resources :game_players, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
