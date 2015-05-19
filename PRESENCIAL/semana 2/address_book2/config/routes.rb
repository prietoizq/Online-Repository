Rails.application.routes.draw do

   get '/' => 'contacts#index'
   resources :contacts do
   	resources :phones
   	resources :emails
   end

end
