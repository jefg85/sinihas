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

class Seguridad::Usuario < ActiveRecord::Base

 # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :apellidos, :nombres, :usuario,
  :email, :password, :password_confirmation, :remember_me

	audit(:create,:update, :destroy, :only => [:usuario,:nombres,:apellidos,:email])
	
	validates_presence_of :nombres,:apellidos,:usuario, :message => "Campo Requerido"
  
  validates_format_of :nombres, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :apellidos, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :usuario, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombres, :maximum => 200, :too_long => "Texto muy largo"
  validates_length_of :apellidos, :maximum => 200, :too_long => "Texto muy largo"
  
  

end
