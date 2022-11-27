Rails.application.routes.draw do
  get 'qrcode/new'
  get 'qrcode/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "qrcode#new"
end
