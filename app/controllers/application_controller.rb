class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Reportes
  # CI, FABRICADOR, PROVEEDOR
  # INCIDENTE, PETICION, SERVICIO
  
  # lista de peticiones por fecha
  # lista de peticiones por servicio
  # peticiones por categoria
  
  # incidente por categoria
   
  
  #valida la autenticaci�n
  before_filter :authenticate_usuario!  
  before_filter :set_current_user
  
  
  #Descripci�n: Obtiene el ip del cliente  
  def remote_ip    
      request.remote_ip    
  end

  def set_current_user
    if usuario_signed_in?
      Auditor::User.current_user = current_usuario  
    end  
  end
end
