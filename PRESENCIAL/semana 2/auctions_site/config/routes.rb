Rails.application.routes.draw do
  get '/' => 'site#home', as: 'root'

  resources :products do
  	resources :bids
  end
end
