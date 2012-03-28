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
//= require_tree .
$('.dropdown-toggle').dropdown()


function addsprints(e) {
	if (e.checked === true) {
		var x = e.value;
		var f = 'fp'+x;
		var val = document.getElementsByClassName(f);
		var res = val[0].innerHTML;
		var valor = document.getElementById('fp-tot').innerHTML;
		var suma = 0;
			if (valor===""){
				suma = parseInt(res);
			} else {
				suma = parseInt(valor) + parseInt(res);
			}
		document.getElementById('fp-tot').innerHTML = suma;
	} else {
		var x = e.value;
		var f = 'fp'+x;
		var val = document.getElementsByClassName(f);
		var res = val[0].innerHTML;
		var valor = document.getElementById('fp-tot').innerHTML;
		var resta = 0;
			if (valor===""){
			} else {
				resta = parseInt(valor) - parseInt(res) ;
			}
		document.getElementById('fp-tot').innerHTML = resta;
			
	}
}