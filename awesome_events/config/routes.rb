Rails.application.routes.draw do
  get 'tickets/new'

  get 'tickets/create'

  resources :events

   root to: 'welcome#index'
   get '/auth/:provider/callback' => 'sessions#create'
   get '/logout' => 'sessions#destroy', as: :logout

   resources :events do
	  resources :tickets
   end
end
