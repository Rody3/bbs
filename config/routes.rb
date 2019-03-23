Rails.application.routes.draw do
  get 'static_pages/top'

  # get 'static_pages/top'
  root 'static_pages#top'
  get '/tweets', to:'tweets#new', as: 'new_tweet'  # この行を追加
  post '/tweets/create' , to: 'tweets#create'
  get '/questions', to:'questions#new', as: 'new_question'
  post '/questions/create' , to: 'questions#create' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
