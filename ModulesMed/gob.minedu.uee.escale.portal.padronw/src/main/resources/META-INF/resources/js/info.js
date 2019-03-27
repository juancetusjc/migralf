/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var PADRON_URL="/padron"
//var PADRON_URL="http://10.36.131.251:8080/padron"
var PADRON_REST_URL=PADRON_URL+"/rest/instituciones/"+cod_mod+"/"+anexo+"/?expandLevel=5"
jQuery(document).ready(initForm)
function initForm(){
     jQuery("#img_cargando").ajaxStart(function(){
        jQuery(this).show();
    }).ajaxStop(function(){
        jQuery(this).hide();
    })
    jQuery.getJSON(PADRON_REST_URL,mostrarIE)
}
