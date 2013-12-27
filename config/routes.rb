Starterlist::Application.routes.draw do
  root to: 'home#index'

  #API
  get '/list/new.:format' => 'list#new', constraints: {:format => /json/}
  post '/list/create.:format' => 'list#create', constraints: {:format => /json/}
  get 'list/:custom_url.:format' => 'list#show', constraints: {:format => /json/}
  patch '/list/:custom_url.:format' => 'list#update', constraints: {:format => /json/}
  
  #Wildcard Route for Custom URLs
  get '/:custom_url' => 'home#index'
end
