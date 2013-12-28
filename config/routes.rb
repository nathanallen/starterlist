Starterlist::Application.routes.draw do
  root to: 'home#index'

  #API
  post 'lists/create' => 'lists#create'
  post 'lists/subscribe' => 'lists#subscribe'
end
