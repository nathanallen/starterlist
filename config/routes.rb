Starterlist::Application.routes.draw do
  root to: 'home#index'
  #resources :list, only: [:create]
  
  get '/list/new.:format' => 'list#new', constraints: {:format => /json/}
  post '/list/create.:format' => 'list#create', constraints: {:format => /json/}
  get 'list/:custom_url.:format' => 'list#show', constraints: {:format => /json/}
  patch '/list/:custom_url.:format' => 'list#update', constraints: {:format => /json/}
  get '/:custom_url' => 'home#index'

  # get '/quizzes.:format', to: 'quizzes#index', as: :quizzes, constraints: {:format => /json/}
  # get '/quizzes/:quiz_id/questions/next.:format', to: 'questions#next', as: :next_question, constraints: {:format => /json/}
  # post '/questions/:question_id/answers.:format', to: 'questions#answer', as: :submit_answer, constraints: {:format => /json/}

end
