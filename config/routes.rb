Rails.application.routes.draw do
  get 'qrcodes/new'
  get 'qrcodes/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "qrcodes#new"
end
