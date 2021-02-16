Rails.application.routes.draw do
  get '/', :to => redirect('/casos')
  get '/alumnos/:id/casos', :to => 'alumnos#casos'
  get '/caso/:id/alumno/new', :to => 'alumnos#new'
  resources :faltas
  resources :contravenciones
  resources :sanciones
  resources :documentos
  resources :seguimientos
  resources :castigos
  resources :involucrados
  resources :casos do
    resources :involucrados
  end
  resources :casos do
    resources :involucrados do
      resources :contravenciones
    end
  end
  resources :casos do
    resources :involucrados do
      resources :castigos
    end
  end
  resources :casos do
    resources :seguimientos do
      resources :documentos
    end
  end
  resources :alumnos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
