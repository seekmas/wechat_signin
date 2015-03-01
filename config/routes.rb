Rails.application.routes.draw do
    
  resources :medals

  resources :comments

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #get
  get '/data' => 'home#data' , :as => 'list_data'

  #menu
  get '/user_info_menu' => 'card#user_info_menu' , :as => 'user_info_menu'

  #card
  get '/scheduler' => 'card#scheduler' , :as => 'scheduler'
  get '/my-card' => 'card#index' , :as => 'my_card'
  get '/:id/medals' => 'card#show_medal' , :as => 'show_medal'
  get '/new-card' => 'card#new' , :as => 'new_card'
  get '/show-card/:id' => 'card#show' , :as => 'show_card'
  get '/all-medals' => 'card#medal' , :as => 'all_medals'
  get '/set_medals' => 'card#set_medals' , :as => 'set_medals'
  get '/comment/:id' => 'card#comment' , :as => 'card_comment'
  get '/card_info' => 'card#card_info' , :as => 'card_info'

  get '/:id/list_comment' => 'card#list_comment' , :as => 'list_comment'
  post '/save-card' => 'card#save' , :as => 'save_card'
  post '/comment_on' => 'card#comment_on' , :as => 'comment_on'


  #scheduler
  get '/my-scheduler' => 'scheduler#all' , :as => 'my_scheduler'
  post '/new-scheduler' => 'scheduler#new' , :as => 'new_scheduler'

  root 'home#index'

end
