/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var PADRON_URL="/padron"
//var PADRON_URL="http://10.36.131.251:8080/padron"
//var PADRON_URL="http://localhost:8080/padron"
var PADRON_REST_URL=PADRON_URL+"/rest"
var PADRON_XLS_URL=PADRON_URL+"/xls/padron"
jQuery(document).ready(initForm)
var inicio=0;
var cantTotal=0;
function initForm(){
    abrirAvisoAcceso();
    jQuery( "#tabs" ).tabs();
    jQuery("#departamento").change(cambiaDpto)
    jQuery("#provincia").change(cambiaProv)
    jQuery("#dre").change(cambiaDre)
    jQuery.getJSON(PADRON_REST_URL+"/regiones",function(data){
        jQuery("<option/>",{
            innerHTML:":: Departamento ::",
            value:""
        }).appendTo("#departamento")
        jQuery.each(data.region,function (i,item){
            jQuery("<option/>",{
                innerHTML:item.nombreRegion,
                value:item.idRegion
            }).appendTo("#departamento")
        })
    })
    jQuery.getJSON(PADRON_REST_URL+"/direccionesRegionales",function(data){
        jQuery("<option/>",{
            innerHTML:":: DREs ::",
            value:""
        }).appendTo("#dre")
        jQuery.each(data.direccionRegional,function (i,item){
            jQuery("<option/>",{
                innerHTML:item.nombreDre,
                value:item.id
            }).appendTo("#dre")
        })
    })
    cambiaDpto()
    cambiaProv()
    jQuery("#buscar").click(function(){
        inicio=0
        cantTotal=0
        buscarIIEE()
    })

    jQuery("input[name='gestion'],input[name='nivel']").attr("checked","checked")/*.change(buscarIIEE)*/
    jQuery("#img_cargando").ajaxStart(function(){
        jQuery(this).show();
    }).ajaxStop(function(){
        jQuery(this).hide();
    }).ajaxError(function(){
        jQuery(this).hide();
    })
    jQuery("#nivel-all").change(function(){
        jQuery("input[name='nivel']").attr("checked",jQuery(this).is(":checked"))
    })
    jQuery("#gestion-all").change(function(){
        jQuery("input[name='gestion']").attr("checked",jQuery(this).is(":checked"))
    })
    jQuery("#estado-all").change(function(){
        jQuery("input[name='estado']").attr("checked",jQuery(this).is(":checked"))
    })
    jQuery("input[name='nivel']").change(function(){
        jQuery("#nivel-all").attr("checked",jQuery("input[name='nivel']").length==jQuery("input[name='nivel']:checked").length)
    })
    jQuery("input[name='gestion']").change(function(){
        jQuery("#gestion-all").attr("checked",jQuery("input[name='gestion']").length==jQuery("input[name='gestion']:checked").length)
    })
    jQuery("input[name='estado']").change(function(){
        jQuery("#estado-all").attr("checked",jQuery("input[name='estado']").length==jQuery("input[name='estado']:checked").length)
    })

    jQuery("input[name='intervencion-juntos']").change(function(){
        if(!jQuery(this).is(":checked") && (jQuery("input[name='intervencion-vrae']").is(":checked") && jQuery("input[name='intervencion-crecer']").is(":checked"))){
            jQuery("input[name='intervencion-ninguno']").attr("checked",false)
        }
    })
    jQuery("input[name='intervencion-vrae']").change(function(){
        if(!jQuery(this).is(":checked")&&(jQuery("input[name='intervencion-juntos']").is(":checked") && jQuery("input[name='intervencion-crecer']").is(":checked") )){
            jQuery("input[name='intervencion-ninguno']").attr("checked",false)
        }
    })
    jQuery("input[name='intervencion-crecer']").change(function(){
        if(!jQuery(this).is(":checked") &&(jQuery("input[name='intervencion-vrae']").is(":checked")&& jQuery("input[name='intervencion-juntos']").is(":checked"))){
            jQuery("input[name='intervencion-ninguno']").attr("checked",false)
        }
    })


    jQuery("#selector_campos").click(function(){
        jQuery("#camposDlg").dialog("open")    
        return false
    })
    jQuery("#camposDlg").dialog({
        autoOpen:false,
        width:"450px",
        modal:true,
        title:"Seleccionar campos",
        buttons:{
            "Cerrar":actualizarCampos
        }
    })
    jQuery("#limpiar").click(function(){
        jQuery("#listadoIIEE thead tr,#listadoIIEE tbody,.paginador,#cuenta,#avisoBq span").empty();
        jQuery("#exportar_excel").hide();
        document.getElementById("buscarIIEEForm").reset();
    })
    jQuery("#gestionDependencia,#nivelModalidad,#codMod,#cenEdu,#distrito,#dirCen,#nrocalle,#talumno").attr("checked","checked")
    //jQuery("#filaAvisoBq").remove()
	
	    jQuery("#consultaDlg").dialog({
        autoOpen:false,
        width:"400px",
        modal:true,
        title:"Exportar Consulta",
        buttons:{
            "Aceptar":function(){

                if(validar_email(jQuery("#email_xls").val()))
                {   var email={email:jQuery("#email_xls").val()}
                     jQuery.get(jQuery("#exportar_excel").attr("href"),email,function(){
                    alert("Su petición se envió correctamente, por favor verifique su correo electrónico ingresado!")
                    jQuery("#email_xls").val("")
                })
                jQuery("#consultaDlg").dialog("close");
            }else{
                alert("El email no es valido");
            }
            },
            "Cancelar":function(){
                jQuery("#email_xls").val("")
                jQuery("#consultaDlg").dialog("close");
            }
        }
    })

    jQuery("#downloadFile").dialog({
        autoOpen:false,
        width:"400px",
        modal:true,
        title:"Descargar Padrón",
        buttons:{
            "Cerrar":function(){
                jQuery("#downloadFile").dialog("close");
            }
        }
    })
}
function actualizarCampos(){
    buscarIIEE()
    jQuery("#camposDlg").dialog("close")
}
function seleccionarCampos(){
    return false;
}
function cambiaDpto(){
    jQuery("#dre,#ugel").val("")
    jQuery("#provincia").empty()
    jQuery("<option/>",{
        innerHTML:":: Provincia ::",
        value:""
    }).appendTo("#provincia")
    cambiaProv()
    var idRegion=jQuery("#departamento").val()
    if (idRegion==null || idRegion=="") return;
    jQuery.getJSON(PADRON_REST_URL+"/provincias",{
        idRegion:idRegion
    },function(data){
        if (jQuery.isArray(data.provincia))    {
            jQuery.each(data.provincia,function (i,item){
                jQuery("<option/>",{
                    innerHTML:item.nombreProvincia,
                    value:item.idProvincia
                }).appendTo("#provincia")
            })
        }else{
            var item=data.provincia
            jQuery("<option/>",{
                innerHTML:item.nombreProvincia,
                value:item.idProvincia
            }).appendTo("#provincia")
        }
    })
}

function cambiaProv(){
    jQuery("#ubigeo").empty()
    jQuery("<option/>",{
        innerHTML:":: Distrito ::",
        value:""
    }).appendTo("#ubigeo")
    var idProvincia=jQuery("#provincia").val()
    if (idProvincia==null || idProvincia=="")return;
    jQuery.getJSON(PADRON_REST_URL+"/distritos",{
        idProvincia:idProvincia
    },function(data){
        if(jQuery.isArray(data.distrito))
        {   jQuery.each(data.distrito,function (i,item){
            jQuery("<option/>",{
                innerHTML:item.nombreDistrito,
                value:item.idDistrito
            }).appendTo("#ubigeo")
            })
        }else{
           var item=data.distrito
           jQuery("<option/>",{
           innerHTML:item.nombreDistrito,
           value:item.idDistrito
           }).appendTo("#ubigeo")
       }
    }

    )

}
function cambiaDre(recargar){
    jQuery("#departamento,#provincia,#ubigeo").val("")

    jQuery("#ugel").empty()
    jQuery("<option/>",{
        innerHTML:":: UGEL ::",
        value:""
    }).appendTo("#ugel")
    var idDre=jQuery("#dre").val()
    if (idDre==null || idDre=="")return;
    jQuery.getJSON(PADRON_REST_URL+"/ugels",{
        idDre:idDre
    },function(data){

        jQuery.each(data.ugel,function (i,item){
            jQuery("<option/>",{
                innerHTML:item.nombreUgel,
                value:item.idUgel
            }).appendTo("#ugel")
        })
    })
}
var campos;
var key
function buscarIIEE(){
    
    jQuery("#exportar_excel").hide()
    jQuery(".paginador").empty()
    var theadTr=jQuery("#listadoIIEE thead tr").empty()
    jQuery("#listadoIIEE tbody").empty()
    var ubigeo=jQuery("#ubigeo").val()
    var ugel=jQuery("#ugel").val()
    if (ubigeo==null || ubigeo==""){
        ubigeo=jQuery("#provincia").val();
        if (ubigeo==null || ubigeo==""){
            ubigeo=jQuery("#departamento").val()
            if (ubigeo==null) ubigeo="";
        }
    }
    if (ugel==null || ugel==""){
        ugel=jQuery("#dre").val()
        if (ugel==null || ugel=="") ugel="";

    }
    //alert(ugel)
    var codmod=jQuery("#cod_mod").val()
    var codlocal=jQuery("#codlocal").val()
    var nombreIE=jQuery("#nombreIE").val()
    var nombreCP=jQuery("#nombreCP").val()
    key=jQuery("#key").val()
    var $niveles=jQuery("input[name='nivel']:checked")
    var niveles=$niveles.length==jQuery("input[name='nivel']").length ?"":   _crear_parametros($niveles,"niveles");
    var $gestiones=jQuery("input[name='gestion']:checked")
    var gestiones=$gestiones.length==jQuery("input[name='gestion']").length ?"":_crear_parametros($gestiones,"gestiones")
    

    var $estados=jQuery("input[name='estado']:checked")
    var estados=$estados.length==jQuery("input[name='estado']").length ?"":_crear_parametros($estados,"estados")
    
    //var $tipoices=jQuery("input[name='tipoice']:checked")
    //var tipoices=jQuery("input[name='tipoice']").length>0?_crear_parametros($tipoices,"tipoices"):0;

    var $formas=jQuery("input[name='forma']:checked")
    var formas=$formas.length==jQuery("input[name='forma']").length ?"":_crear_parametros($formas,"formas")

    var $disVrae=jQuery("input[name='intervencion-vrae']:checked")
    var disVrae=$disVrae == undefined?"":$disVrae.val()
    var $disJuntos=jQuery("input[name='intervencion-juntos']:checked")
    var disJuntos=$disJuntos == undefined?"":$disJuntos.val()
    var $disCrecer=jQuery("input[name='intervencion-crecer']:checked")
    var disCrecer=$disCrecer == undefined?"":$disCrecer.val()
    var $disNinguno=jQuery("input[name='intervencion-ninguno']:checked")
    var disNinguno=$disNinguno == undefined?"":$disNinguno.val()
    var $matIndigena=jQuery("input[name='matIndigena']:checked")
    var matIndigena=$matIndigena.length==jQuery("input[name='matIndigena']").length?"":($matIndigena==undefined?"":$matIndigena.val())

    var $areas=jQuery("input[name='area']:checked")
    var areas=$areas.length==jQuery("input[name='area']").length ?"":_crear_parametros($areas,"areas")


    

    
    var filtro={
        ubigeo:ubigeo,
        nombreIE:nombreIE,
        ugel:ugel,
        start:inicio,
        codmod:codmod,
        codlocal:codlocal,
        nombreCP:nombreCP,
        disVrae:disVrae,
        disJuntos:disJuntos,
        disCrecer:disCrecer,
        disNinguno:disNinguno,
        matIndigena:matIndigena
    }
    var $campos=jQuery("input:checked[name='campo']")
    campos=new Array();
    jQuery("<th/>").text("#").appendTo(theadTr)
    var camposXLS=""
    jQuery.each($campos,function(i,campo){
        var campoVal=jQuery(campo).val()

        campos[i]=campoVal
        if (campoVal!="tdocente" && campoVal!="tseccion" && campoVal!="talumno")
            camposXLS+=("&campos="+campoVal)
        var labels=jQuery("label[for='"+campoVal+"']")
        
        if (campoVal!="caracteristica" && campoVal!="tdocente" && campoVal!="tseccion" && campoVal!="talumno")
            jQuery("<th/>").text(labels.text()).appendTo(theadTr);
        else
            jQuery("<th style = 'background:#6FA7D1' />").text(labels.text()).appendTo(theadTr);
    })
    
    //var queryBase=niveles+estados+gestiones+tipoices+formas //arreglo principales
    var queryBase=niveles+estados+gestiones+formas+areas //arreglo principales


    var url=PADRON_REST_URL+"/instituciones?"+queryBase
    var urlCuenta=PADRON_REST_URL+"/instituciones/cuenta?"+queryBase
    var urlXLS=PADRON_XLS_URL+"?"+queryBase+"&ubigeo="+ubigeo+"&nombreIE="+nombreIE+"&nombreCP="+nombreCP+"&ugel="+ugel+"&codmod="+codmod+"&key="+key+camposXLS+"&codlocal="+codlocal+"&matIndigena="+matIndigena+"&disVrae="+disVrae+"&disCrecer="+disCrecer+"&disJuntos="+disJuntos+"&disNinguno="+disNinguno
     
    jQuery("#exportar_excel").attr("href",urlXLS)
    
    
    
    
    if(cantTotal==0)
    {   jQuery.get(urlCuenta,filtro, cargarCuenta, "text")
        //jQuery.get(url,filtro, cargarCuenta, "text")
    }else
        {
            cargarCuenta(cantTotal)

        }
    
    jQuery.getJSON(url,filtro,cargarIIEE)
}
function _crear_parametros($items,param){
    var params=""
    jQuery.each($items,function(i,item){
        var s=jQuery(item).val()
        var a=s.split(",")
        jQuery.each(a,function(j,b){
            params+="&"+param+"="+b
        })
    })
    return params
}

function cargarCuenta(cuenta){

    cantTotal=cuenta;
    var max=50;
    var $cuenta=parseInt(cuenta)
    if (isNaN($cuenta))return;

    if (inicio>0){
        jQuery("<a/>",{
            innerHTML:"Anterior",
            href:"#"
        }).appendTo(".paginador").click(function(){
            inicio-=max
            buscarIIEE()
            return false
        })
    }
  /*  var numPaginas=cuenta / max;
    for(var ip=0;ip<numPaginas;ip++){
        var inicioTmp=max*ip
        if (inicioTmp==inicio)        {
            jQuery("<span/>",{
                innerHTML:(ip+1)
            } ).appendTo(".paginador")
        } else{
            jQuery("<a/>",{
                innerHTML:(ip+1),
                href:("#"+inicioTmp)
            }).appendTo(".paginador").click(function(){
                inicio=parseInt( this.href.substr(this.href.indexOf("#")+1))
                buscarIIEE()
                return false
            })
        }
    } */
    if ($cuenta>(inicio+max)){
        jQuery("<a/>",{
            innerHTML:"Siguiente",
            href:"#"
        }).appendTo(".paginador").click(function(){
            inicio+=max
            buscarIIEE()
            return false
        })
        
    }
    //aproximando la cantidad de datos
    //cantidad de registros por cantidad de columnas
    //if ($cuenta>5000){

    var cnDatos = $cuenta*campos.length;

    //if ($cuenta>65536){
    if (cnDatos > 65000){
          jQuery("#exportar_excel").click(function(){
            /*if (confirm("Existen más de 65 mil registros para ser exportados a Excel. Sin embargo, la versión Excel 2007 soporta más de esta cantidad.\n¿Desea exportar la lista usando la versión 2007 de Excel?")){
                this.href+="&tipo=xlsx";
                return true;
            }
            return false;
			*/
			this.href+="&tipo=xlsx&cantidad="+$cuenta;
            //Email Dialog
            //jQuery("#consultaDlg").dialog("open");
            //Ruta de Padron
            jQuery("#downloadFile").dialog("open");
           // alert("ABRE DIALOG")
            return false;
        })
    }else{
        jQuery("#exportar_excel").unbind("click")
    }
    jQuery("#cuenta").text("Total: "+cuenta)
    if($cuenta>0)
    jQuery("#avisoBq span").text("Haga clic sobre el código modular para obtener la ficha de datos correspondiente")

}
function agregarIIEEListado(tbody,i,ie){
    var url=context+"info/ce?cod_mod="+ie.codMod+"&anexo="+ie.anexo
    /*var tr=jQuery("<tr/>").appendTo(tbody).addClass(i%2==0?"par":"impar").dblclick(function(){
        window.open(url,"_blank")
    })*/
    var tr=jQuery("<tr/>").appendTo(tbody).addClass(i%2==0?"par":"impar");
    
    jQuery("<td/>",{
        innerHTML:(i+inicio+1)
    }).appendTo(tr)
    if (jQuery.inArray("codMod",campos)>=0){
        var codmod=jQuery("<a/>",{
            innerHTML:ie.codMod,
            href:url,
            target:"_blank"
        })
        jQuery("<td/>").appendTo(tr).append(codmod)
    }
    
    if (jQuery.inArray("anexo",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.anexo
        }).appendTo(tr)
    }
    if (jQuery.inArray("codlocal",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.codlocal
        }).appendTo(tr)
    }
    if (jQuery.inArray("cenEdu",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.cenEdu
        }).appendTo(tr)
    }
    if (jQuery.inArray("nivelModalidad",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.nivelModalidad==undefined?"":ie.nivelModalidad.valor
        }).appendTo(tr)
    }
 if (jQuery.inArray("forma",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.forma.valor
        }).appendTo(tr)
    }
 if (jQuery.inArray("genero",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.genero.valor
        }).appendTo(tr)
    }
if (jQuery.inArray("gestion",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.gestion
        }).appendTo(tr)
    }

    if (jQuery.inArray("gestionDependencia",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.gestionDependencia.valor
        }).appendTo(tr)
    }

    if (jQuery.inArray("director",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.director
        }).appendTo(tr)
    }

   

  if (jQuery.inArray("telefono",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.telefono
        }).appendTo(tr)
    }
    if (jQuery.inArray("email",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.email
        }).appendTo(tr)
    }
    if (jQuery.inArray("pagweb",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.pagweb
        }).appendTo(tr)
    }

    if (jQuery.inArray("estado",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.estado.valor
        }).appendTo(tr)
    }
    if (jQuery.inArray("dirCen",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.dirCen
        }).appendTo(tr)
    }

    if (jQuery.inArray("localidad",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.localidad
        }).appendTo(tr)
    }

    if (jQuery.inArray("cenPob",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.cenPob
        }).appendTo(tr)
    }

    if (jQuery.inArray("areaSig",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.areaSig==undefined?"": ie.areaSig.valor
        }).appendTo(tr)
    }

    if (jQuery.inArray("distrito",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.distrito.provincia.region.nombreRegion
            +" / "+ie.distrito.provincia.nombreProvincia
            +" / "+ie.distrito.nombreDistrito
        }).appendTo(tr)
    }


    if (jQuery.inArray("nomDepartamento",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.distrito.provincia.region.nombreRegion
        }).appendTo(tr)
    }

    if (jQuery.inArray("nomProvincia",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.distrito.provincia.nombreProvincia
        }).appendTo(tr)
    }

    if (jQuery.inArray("nomDistrito",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.distrito.nombreDistrito
        }).appendTo(tr)
    }

    if (jQuery.inArray("codGeo",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.distrito.idDistrito
        }).appendTo(tr)
    }

    if (jQuery.inArray("codooii",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.ugel==undefined?'':ie.ugel.idUgel
        }).appendTo(tr)
    }

    if (jQuery.inArray("nomUgel",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.ugel==undefined?"":(ie.ugel.direccionRegional==undefined?"": ie.ugel.direccionRegional.nombreDre
                +" / ")+(ie.ugel.nombreUgel)
        }).appendTo(tr)
    }

    if (jQuery.inArray("lenEtnica",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.lenEtnica!=undefined && ie.lenEtnica!=''?ie.lenEtnica:""
        }).appendTo(tr)
    }
    if (jQuery.inArray("disCrecer",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.dis_crecer
        }).appendTo(tr)
    }

    if (jQuery.inArray("disJuntos",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.dis_juntos
        }).appendTo(tr)
    }
    if (jQuery.inArray("disVrae",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.dis_vrae
        }).appendTo(tr)
    }
    
    if (jQuery.inArray("tipoprog",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.tipoprog==undefined?"": ie.tipoprog.valor
        }).appendTo(tr)
    }
    if (jQuery.inArray("turno",campos)>=0){
        if(ie.turno!=undefined )
        {jQuery("<td/>",{
            innerHTML:ie.turno.valor
        }).appendTo(tr)}else{
        jQuery("<td/>",{
            innerHTML:".."
        }).appendTo(tr)        
        }

    }
    if (jQuery.inArray("caracteristica",campos)>=0){
        jQuery("<td/>",{
            innerHTML:ie.caracteristica
        }).appendTo(tr)
    }
  //,estado,dirCen,localidad,cenPob,areaSig,distrito,codGeo,codooii,ugel,lengua,disCrecer,disJuntos,disVrae,talumno,tdocente,tseccion
   
  
    //motivoResolucion,tipoResolucion,numRes,fechares
   
    var tdocente=0,talumno=0,tseccion=0
    if (ie.estadistica==undefined || ie.estadistica.imputado=='1' ){
        tdocente="..";
        talumno="..";
        tseccion=".."
    }else
    if (jQuery.isArray(ie.estadistica)){

        jQuery.each(ie.estadistica,function(i,est){
            if (est.imputado !='1' ){
            tdocente+=new Number(est.tdocente)
            tseccion+=new Number(est.tseccion)
            talumno+=new Number(est.talumno)
            }
        })

    }else{
        tdocente=new Number(ie.estadistica.tdocente)
        tseccion=new Number(ie.estadistica.tseccion)
        talumno=new Number(ie.estadistica.talumno)
    }
    if (jQuery.inArray("talumno",campos)>=0){
        jQuery("<td/>",{
            innerHTML:talumno
        }).appendTo(tr)
    }
    if (jQuery.inArray("tdocente",campos)>=0){
        jQuery("<td/>",{
            innerHTML:(ie.gestionDependencia.idCodigo.substr(0,1)=="A" || (ie.gestionDependencia.idCodigo.substr(0,1)=="B" && key!=""))? tdocente:""
        }).appendTo(tr)
    }
    if (jQuery.inArray("tseccion",campos)>=0){
        jQuery("<td/>",{
            innerHTML:(ie.gestionDependencia.idCodigo.substr(0,1)=="A" || (ie.gestionDependencia.idCodigo.substr(0,1)=="B" && key!=""))?tseccion:""
        }).appendTo(tr)
    }
}
function cargarIIEE(data){    
    jQuery("#exportar_excel").attr("style","display:block")
    var tbody=jQuery("#listadoIIEE tbody")
        
    if (data.items!=undefined)    
    {
        if (jQuery.isArray(data.items)){        
            jQuery.each(data.items,function(i,ie){            
                agregarIIEEListado(tbody,i, ie)
            })
        }else{ 
            agregarIIEEListado(tbody,0, data.items)            
        }
    }
}


function abrirAvisoAcceso()
{
    ok=false;
    jQuery("#aviso-acceso").dialog("open")    
    jQuery("#aviso-acceso").dialog({closeOnEscape:false,modal:true,width:700,buttons:{"Acepto los términos arriba expuestos.":function(){
        ok=true;
        jQuery(this).dialog("close")
    },"No acepto. Cerrar la ventana.":function(){        
        ok=false;
        jQuery(this).dialog("close")
    }},
close:function(event,ui){
    if (!ok)
        location.href="http://escale.minedu.gob.pe/inicio";
    //else
        //jQuery("#contenidoCuerpo").show("slow")
    }

                            }
                             )

}


function validar_email(valor)
    {
        // creamos nuestra regla con expresiones regulares.
        var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
        // utilizamos test para comprobar si el parametro valor cumple la regla
        if(filter.test(valor))
            return true;
        else
            return false;
    }
