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
  get 'trader/autocomplete', to: 'traders#autocomplete'
  get 'action/autocomplete', to: 'actions#autocomplete'
end
