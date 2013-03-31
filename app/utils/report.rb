# encoding: utf-8
=begin

==SINIHAS                                                          
Copyright (C)  2012  SINIHAS
                                                                   
* Nombre archivo: -
* Descripción:                                                               
* Versión        1.0 
* Creado por:       
* Creado el:                                                                                                                          

=end
class Utils::Report 
   
      
  def initialize()  
   
    @parametros = Array.new 
    @contentType = {"PDF"=>"application/pdf","RTF"=>"application/ms-word","XLS"=>"application/vnd.xls"}    
  end
  
  def agregar_parametro(clave,valor)
    @parametros.push({"clave"=>clave,"valor"=>valor})    
  end
  
  def getContentType(format)
    @contentType[format]
  end
  
  
  def getReport(format,report) 
    
    

    #creando cliente
    #server = 'http://localhost:8080/jasperserver/services/repository'
    #user= 'jasperadmin'
    #password='jasperadmin'
    
    server = Seguridad::Configuracion.where("codigo = '101'")[0].valor
    user= Seguridad::Configuracion.where("codigo = '102'")[0].valor
    password=Seguridad::Configuracion.where("codigo = '103'")[0].valor

      
    @client = Savon::Client.new {
      wsdl.document = "#{server}?wsdl"
      http.auth.basic user, password
    }
    
    #parametros
    parametrosReporte = ''
    
    @parametros.each do |p|
      parametrosReporte+="<parameter name='#{p['clave']}'>#{p['valor']}</parameter>"      
    end   
    
    #Obteniendo Reporte
    begin
      @result = @client.request :run_report do
       soap.body = "<requestXmlString>
         <![CDATA[
          <request operationName='runReport' >
           <argument name='RUN_OUTPUT_FORMAT'>#{format}</argument>
           <resourceDescriptor name='' wsType='' uriString='#{report}' isNew='false'>
           #{parametrosReporte}           
           <label></label>           
         </resourceDescriptor>
          </request>
         ]]>
         </requestXmlString>"
     end  
     
#     begin
#      @result = @client.request :run_report do
#       soap.body = { 
#         :request => {
#           :argument => format,   
#           :resourceDescriptor => @parametros,        
#           :attributes! => { 
#             :argument => { :name => 'RUN_OUTPUT_FORMAT' },
#             :resourceDescriptor => {:name=>'',:wsType=>'',:uriString=>report,:isNew=>false} 
#           }
#          },:attributes! => {
#            :request => {:operationName=>'runReport'}
#           }
#       }
#     end
             
          
     @result.http.body.split('------=_Part_')[2].split('Content-Id: <report>')[1].strip
    
    rescue Exception => e
     Rails.logger.error "SOAP Error: #{e}"
    end
  end

end