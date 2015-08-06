Rails.application.routes.draw do
  get '/consultation-traders', :to => 'traders#index'

  get 'traders/list'
  get 'traders/show'
  get 'traders/new'
  post 'traders/create'
  get 'traders/edit'
  post 'traders/update'
  get 'traders/delete'

end
