Rails.application.routes.draw do
  #Ressources
  resources :traders do
    resources :trades
  end

  resources :trades

  resources :actions do
    resources :trades
  end

  # Autocomplete
  get 'trades/autocomplete/trader', to: 'trades#autocomplete_trader'
  get 'trades/autocomplete/action', to: 'trades#autocomplete_action'
end
