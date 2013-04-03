SINIHAS::Application.routes.draw do

  namespace :seguridad do resources :configuracions end

  devise_for :usuarios , :class_name => "Seguridad::Usuario" , :path => '', :path_names => { :sign_in => 'login' } do
    get 'logout' , :to => 'devise/sessions#destroy'    
  end  
  
  root :to => 'home#index'

  get 'home/menu'

  get 'seguridad/roles/quitarmenu'
  
  get '/activo/proveedor_cis/report'
  get '/activo/fabricador_cis/report' 
  
  get '/incidente/incidentes/report_tipo'
  get '/incidente/incidentes/report_tipo_resumen'
  get '/incidente/incidentes/report_estado'
  get '/incidente/incidentes/report_estado_resumen'
  get '/incidente/incidentes/report_actividades_usuario'
  get '/incidente/incidentes/report_actividades_estado'
  get '/incidente/incidentes/reportes' 
  
  get '/incidente/incidentes/rpt_tipo'
  get '/incidente/incidentes/rpt_tipo_resumen'
  get '/incidente/incidentes/rpt_estado'
  get '/incidente/incidentes/rpt_estado_resumen'
  get '/incidente/incidentes/rpt_actividades_usuario'
  get '/incidente/incidentes/rpt_actividades_estado'
  
   
  get '/activo/cis/report' 
  get '/peticion/peticion_tis/report' 
  get '/peticion/servicio_tis/report'   

  match '/roles/agregarmenu' => 'seguridad/roles#agregarmenu', :via => :get
  match '/roles/seleccionarmenu' => 'seguridad/roles#seleccionarmenu', :via => :get
  match '/roles/quitarmenu' => 'seguridad/roles#quitarmenu', :via => :get

  match '/usuarios/agregarrol' => 'seguridad/usuarios#agregarrol', :via => :get
  match '/usuarios/seleccionarrol' => 'seguridad/usuarios#seleccionarrol', :via => :get
  match '/usuarios/quitarrol' => 'seguridad/usuarios#quitarrol', :via => :get

  match '/estado_cis/agregarcategoria' => 'activo/estado_cis#agregarcategoria', :via => :get
  match '/estado_cis/quitarcategoria' => 'activo/estado_cis#quitarcategoria', :via => :get
  match '/estado_cis/seleccionarcategoria' => 'activo/estado_cis#seleccionarcategoria', :via => :get
  
  match '/propiedad_especifica_cis/agregarcategoria' => 'activo/propiedad_especifica_cis#agregarcategoria', :via => :get
  match '/propiedad_especifica_cis/quitarcategoria' => 'activo/propiedad_especifica_cis#quitarcategoria', :via => :get
  match '/propiedad_especifica_cis/seleccionarcategoria' => 'activo/propiedad_especifica_cis#seleccionarcategoria', :via => :get
  
  match '/fabricador_cis/agregarcategoria' => 'activo/fabricador_cis#agregarcategoria', :via => :get
  match '/fabricador_cis/quitarcategoria' => 'activo/fabricador_cis#quitarcategoria', :via => :get
  match '/fabricador_cis/seleccionarcategoria' => 'activo/fabricador_cis#seleccionarcategoria', :via => :get
  
  match '/peticion_tis/agregarservicio' => 'peticion/peticion_tis#agregarservicio', :via => :get
  match '/peticion_tis/quitarservicio' => 'peticion/peticion_tis#quitarservicio', :via => :get
  match '/peticion_tis/seleccionarservicio' => 'peticion/peticion_tis#seleccionarservicio', :via => :get
  
  

  namespace :peticion do resources :servicio_tis end
  namespace :peticion do resources :peticion_servicio_tis end
  namespace :peticion do resources :peticion_tis end
  namespace :activo do resources :dato_trabajo_cis end
  namespace :activo do resources :relacion_cis end
  namespace :activo do resources :ciclo_vidas end
  namespace :activo do resources :cis end
  namespace :activo do resources :especificacion_cis end
  namespace :activo do resources :propiedad_especifica_categoria_cis end
  namespace :activo do resources :propiedad_especifica_cis end
  namespace :activo do resources :proveedor_cis end
  namespace :activo do resources :estado_categoria_cis end
  namespace :activo do resources :estado_cis end
  namespace :activo do resources :categoria_cis end
  namespace :activo do resources :fabricador_categoria_cis end
  namespace :activo do resources :fabricador_cis end
  namespace :incidente do resources :tipo_incidente_categoria_cis end
  namespace :incidente do resources :actividad_incidentes end
  namespace :incidente do resources :incidentes end
  namespace :catalogo do resources :catalogos end
  namespace :catalogo do resources :tipo_catalogos end
  namespace :seguridad do resources :permisos end
  namespace :seguridad do resources :roles end
  namespace :seguridad do resources :menus end
  namespace :seguridad do resources :rol_menus end
  namespace :seguridad do resources :modulos end
  namespace :seguridad do resources :usuarios end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
