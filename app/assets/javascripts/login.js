// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery  
//= require jquery_ujs
//= require	pnotify/jquery.pnotify
//= require_self




//Notificacion de progreso
var notice = $.pnotify({
	auto_display: false,
	title: "Cargando...",
	type: 'info',
	icon: 'picon',		
	closer: false,
	sticker: false,
	opacity: .75,
	shadow: false,
	history: false,
	width: "150px",
	mouse_reset: false,
	nonblock: true,
	animate_speed: 'fast',
	nonblock_opacity: .2
});

/*Funcion para mandar notificaciones*/
function mostrarMensaje(titulo,mensaje,tipo){	
	var notificacion = $.pnotify({		
		type:tipo,
		title: titulo,
		text: mensaje,
		history: false,
		mouse_reset: false,
		closer: true,
		sticker: true,		
		animate_speed: 'fast',
		delay: 3000,
		remove: true,	
		});			
}


var tooltip = $.pnotify({	 
	 hide: false,
	 closer: false,
	 sticker: false,
	 history: false,
	 animate_speed: 100,	 
	 width:"200px",
	 opacity: 0.9,		 
	 stack: false,
	 after_init: function(pnotify) {
	 pnotify.mouseout(function() {
	 pnotify.pnotify_remove(); }); },
	 before_open: function(pnotify) {
	 pnotify.pnotify({
	 before_open: null });
	 return false; }
 });
 
 
function setToolTip(titulo,mensaje,tipo,element){	
	$(element).mouseout(function(){tooltip.pnotify_remove();});
	$(element).mousemove(function(event){tooltip.css({'top': event.clientY+12, 'left': event.clientX+12});});
	$(element).mouseover(function(){showToolTip(titulo,mensaje,tipo)});	 
}

function removeToolTip(element){
	$(element).unbind('mouseout');
	$(element).unbind('mousemove');
	$(element).unbind('mouseover');
}

function showToolTip(titulo,mensaje,tipo){	
	tooltip.pnotify({
		type:tipo,
		title: titulo,
		text: mensaje
    });	
	tooltip.pnotify_display();	
}



function renderBoolean(val){
	return (val == true) ? "<span style='color: green;'>Si</span>" : "<span style='color: red;'>No</span>" ;	
}