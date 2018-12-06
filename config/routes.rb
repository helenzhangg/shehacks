Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'logins#snew'

  get '/login', to: 'logins#snew'
  post '/login', to: 'logins#screate'
  get '/logout', to: 'logins#sdestroy'

  get '/summary/logout', to: 'logins#sdestroy'
  get '/summary/login', to: 'logins#snew'
  post '/summary/login', to: 'logins#screate'

  get '/typeform', to: 'welcome#typeformget'
  post '/typeform', to: 'welcome#typeformpost'

  post '/rsvp', to: 'welcome#rsvppost'
end
