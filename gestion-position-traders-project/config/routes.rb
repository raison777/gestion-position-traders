Rails.application.routes.draw do
  get 'trades/new'

  get 'trades/create'

  get 'trades/delete'

  get 'actions/new'

  get 'actions/create'

  get 'actions/delete'

  # Alias
  get '/list-traders', :to => 'traders#list'
  get '/add-new-traders', :to => 'traders#new'
  get '/update-trader', :to => 'traders#edit'
  get '/delete-trader', :to => 'traders#delete'


  # Traders Controller
  get 'traders/list'
  get 'traders/show'
  get 'traders/new'
  post 'traders/create'
  get 'traders/edit'
  post 'traders/update'
  get 'traders/delete'

  # Actions Controller

  # Trades Controller

end
