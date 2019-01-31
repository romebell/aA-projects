Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # something to know from memory before writing the routes.
  # get '/users' to 'users#index'
  # get '/users/:id' to 'users#show'
  # post '/users/' to 'users#create'
  # patch '/users/:id' to 'users#update'
  # delete '/users/:id' to 'users#destroy'

=begin
  Prefix Verb   URI Pattern                 Controller#Action
bueller_index GET    /bueller(.:format)          user#index
              POST   /bueller(.:format)          user#create
  new_bueller GET    /bueller/new(.:format)      user#new
 edit_bueller GET    /bueller/:id/edit(.:format) user#edit
      bueller GET    /bueller/:id(.:format)      user#show
              PATCH  /bueller/:id(.:format)      user#update
              PUT    /bueller/:id(.:format)      user#update
              DELETE /bueller/:id(.:format)      user#destroy
=end

  resources :users, only: [:new, :edit, :show]

  resource :session, only: [:new, :create, :destroy]
end


