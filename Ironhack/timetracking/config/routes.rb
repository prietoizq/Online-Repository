Rails.application.routes.draw do

  get '/' => 'site#home'  # site es el controlador, y home es la accion. Las acciones se definen en el site_controller.rb

  get '/contact' => 'site#contact'

  get '/projects' => 'projects#index'

  get '/projects/:id' => 'projects#show'

  get '/projects/:project_id/entries' => 'entries#index'

end