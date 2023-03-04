Rails.application.routes.draw do
  resources :books
  patch '/books/:id', to: 'books#update', as: 'update_book'
  #get '/top' => 'homes#top'
  #root 'books#index'
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
