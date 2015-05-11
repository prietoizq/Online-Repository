Rails.application.routes.draw do

  get '/' => 'site#home'  # site es el controlador, y home es la accion. Las acciones se definen en el site_controller.rb

  get '/contact' => 'site#contact'

end
