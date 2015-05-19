Rails.application.routes.draw do

  get '/' => 'site#home', as: 'root'  # site es el controlador, y home es la accion. Las acciones se definen en el site_controller.rb
  #le ponemos que el site#home sea equivalente al root para así en project controller poder acceder al root_path
  resources :projects do
  	resources :entries
  end

=begin  esto NOS LO VENTILAMOS DESPUES DE HABERLO HECHO TODO YA QUE CON resources :projects NOS LLEVA AUTOMATICAMENTE
A TODAS LAS RUTAS QUE HEMOS IDO CREANDO, YA QUE HEMOS SEGUIDO LAS CONVENCIONES

CON RESOURCES :PROJECTS NOS GENERA LAS RUTAS DEL CRUD AUTOMATICAMENTE POR CONVENCION

y AL PONER RESOURCES :ENTRIES DENTRO DEL DO, END, NOS GENERA LAS RUTAS PERO "DEPENDIENDO" DE LAS RUTAS DEL PROJECTS
QUE ERA TAL Y COMO ACCEDIAMOS ANTES

  get '/contact' => 'site#contact'
  get '/projects' => 'projects#index'
  post '/projects' => 'projects#create' #por convencion se pone: get a project--index ;;; post a project--create
  get '/projects/new' => 'projects#new' #esto es otra convención. Podríamos poner la ruta que quisieramos, en vez de new, pero por convencion se pone así y luego hace las cosas automáticamente
#el project/new hay que ponerlo antes que el project/id, porque si no primero evalua el del :id. Y como es una variable, lo va a coger si o si
#:id es como un sumidero, todo lo que pongamos projects/ALGO me lo toma como parámetro y lo mete en el :id.
#Por eso, hay que poner el new arriba ya que el orden de prioridad va de arriba a abajo
  get '/projects/:id' => 'projects#show'
  get '/projects/:project_id/entries' => 'entries#index'

=end

end