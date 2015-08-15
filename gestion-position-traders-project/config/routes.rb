Rails.application.routes.draw do
=begin
  get 'trades/new'

  get 'trades/create'

  get 'trades/delete'

  get 'actions/new'

  get 'actions/create'

  get 'actions/delete'
=end
  #Ressources
  resources :traders do
    resources :trades
  end

  resources :trades

  resources :actions do
    resources :trades
  end

  # Alias
=begin
  get '/list-traders', :to => 'traders#list'
  get '/add-new-traders', :to => 'traders#new'
  get '/update-trader', :to => 'traders#edit'
  get '/delete-trader', :to => 'traders#delete'
=end

  # Traders Controller
=begin
  get 'traders/list'
  get 'traders/show', as: 'show_trader_path'
  get 'traders/new'
  post 'traders/create'
  get 'traders/edit'
  post 'traders/update'
  get 'traders/delete'
=end

  # Actions Controller

  # Trades Controller

end
