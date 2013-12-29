Starterlist::Application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    post 'lists/create' => 'lists#create'
    post 'lists/subscribe' => 'lists#subscribe'
  end
end
