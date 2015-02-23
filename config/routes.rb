Rails.application.routes.draw do
    
  resources :medals

  resources :comments

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #get
  get '/data' => 'home#data' , :as => 'list_data'


  #card
  get '/scheduler' => 'card#scheduler' , :as => 'scheduler'
  get '/my-card' => 'card#index' , :as => 'my_card'
  get '/new-card' => 'card#new' , :as => 'new_card'
  get '/show-card/:id' => 'card#show' , :as => 'show_card'
  post '/save-card' => 'card#save' , :as => 'save_card'


  #scheduler
  get '/my-scheduler' => 'scheduler#all' , :as => 'my_scheduler'
  post '/new-scheduler' => 'scheduler#new' , :as => 'new_scheduler'

  root 'home#index'

end
