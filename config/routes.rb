Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'logins#snew'
  post '/login', to: 'logins#screate'
  get '/logout', to: 'logins#sdestroy'

  get '/summary/logout', to: 'logins#sdestroy'
  get '/summary/login', to: 'logins#snew'
  post '/summary/login', to: 'logins#screate'
end
