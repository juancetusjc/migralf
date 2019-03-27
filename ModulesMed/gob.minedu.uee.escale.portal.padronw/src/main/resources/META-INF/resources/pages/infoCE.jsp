<%--
    Document   : infoCE
    Created on : 06/02/2011, 07:24:05 PM
    Author     : Diego Silva
--%>

<!--%@page import="com.liferay.util.CookieUtil"%-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="pe.gob.minedu.escale.padron.mensajes" var="msg" />
<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />
<%
//String id= CookieUtil.get(request, "ID");
    String id = "5";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>:: Ficha de Institución Educativa ::</title>
        <script type="text/javascript" src="<c:url value='/resources/jquery/jquery-1.4.4.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/jquery/jquery-ui-1.8.8.custom.min.js'/>"></script>
        <link type="text/css" href="<c:url value='/resources/jquery/css/jquery-ui-1.8.8.custom.css'/>" rel="stylesheet" />
        <link type="text/css" href="<c:url value='/resources/css/padron.css'/>" rel="stylesheet" />
        <script type="text/javascript">var cod_mod='${param.cod_mod}',anexo='${param.anexo}'</script>
        <!--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>-->
        <!-- primero
        <script type="text/javascript" src='http://maps.google.com/maps/api/js?v=3&key=AIzaSyB4Q5x4lRA0xo8VAFeciirBhGA3g9yuyIA&sensor=false&libraries=geometry,drawing,places'></script>-->
        <script type="text/javascript" src='http://maps.google.com/maps/api/js?v=3&key=AIzaSyCsvdMxGmHTZJRGPL50d0hNXBPgyt7SvX0&sensor=false&libraries=geometry,drawing,places'></script>
        <!-- editor de mapas
        <script type="text/javascript" src='http://maps.google.com/maps/api/js?v=3.25&key=AIzaSyCsvdMxGmHTZJRGPL50d0hNXBPgyt7SvX0&sensor=false&libraries=geometry,drawing,places' ></script>-->
        <script type="text/javascript" src="<c:url value='/resources/js/arcgislink.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/ubicacionmapa.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/info.js'/>"></script>
        <!--script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAjU0EJWnWPMv7oQ-jjS7dYxSPW5CJgpdgO_s4yyMovOaVh_KvvhSfpvagV18eOyDWu7VytS6Bi1CWxw"
          type="text/javascript"></script-->

        <script type="text/javascript">
            function comparaFecha(fecha, fecha2){
                var fechaIni=fecha.split("-");
                var fechaFin=fecha2.split("-");
                var fechainicial=fechaIni[2]+fechaIni[1]+fechaIni[0];
                var fechafinal=fechaFin[2]+fechaFin[1]+fechaFin[0];

                if(parseInt(fechainicial)>parseInt(fechafinal)){
                    return 1;
                }else if(parseInt(fechainicial)<parseInt(fechafinal)){
                    return -1;
                }else{
                    return 0;
                }

            }
            function mostrarIE(ie){
                // if (ie.gestionDependencia.idCodigo.substr(0,1)=='B')jQuery("#docentes").remove()
                ubicacionmapa(-9.53575,-75.27832,4,1,ie)
                //ubicacionmapa(0,0,15,1)
                var enFecha="1";
                var totalumno = 0;
                var totseccion = 1;
                // 1.  INICIO  FUNCIONALIDAD PARA DESACTIVAR CUADROS DE CENTROS QUE NO TIENEN INFORMACION ESTADISTICA
                /*if(ie.fechareg!=undefined && ie.fechareg!='' && (comparaFecha("01-11-2010",ie.fechareg)==-1) ){
                    jQuery("#aviso-sn-estadistica").text("Sin información")
                    jQuery("#estadisticas").remove()
                    enFecha="-1"
                }*/
                //FIN 1.
                var niv_mod=ie.nivelModalidad.idCodigo.substr(0,1)
                if (!(niv_mod=='A' || niv_mod=='B' || niv_mod=='F' || niv_mod=='D'|| niv_mod=='K' || niv_mod=='T'|| niv_mod=='M'|| niv_mod=='E' || niv_mod=='L')) jQuery("#estadisticas").remove()
                jQuery("#nombreIE").text( ie.cenEdu)
                jQuery("#TnombreIE").text(ie.cenEdu)
                if (ie.ugel!=undefined){
                    jQuery("#ugel").text(ie.ugel.nombreUgel)
                    //if (ie.igel.direccionRegional!=undefined)
                    // jQuery("#dre").text(ie.ugel.direccionRegional.nombreDre)
                }

                var dirCen=ie.dirCen;
                /*
                if(ie.areaSig.idCodigo=='1'){
                    if(dirCen!=undefined && ie.localidad!=undefined && ie.localidad!=''){
                        dirCen=dirCen+", "+ie.localidad
                    }else  if(ie.localidad!=undefined && ie.localidad!='') {
                        dirCen=ie.localidad
                    }
                    jQuery("#filaCenPob").remove()
                    jQuery("#direccion span").text(dirCen.toLowerCase())
                }else
                {
                    if(ie.cenPob!=undefined && ie.cenPob!='')
                    {   //jQuery("#filaDireccion").remove()
                        jQuery("#cenPob span").text(ie.cenPob.toLowerCase())
                    }
                    if(dirCen!=undefined && dirCen!='' ) {
                        //dirCen=ie.dirCen+", "+ie.localidad
                        jQuery("#direccion span").text(dirCen.toLowerCase())
                        //jQuery("#filaCenPob").remove()
                    }
                }*/

                jQuery("#direccion span").text(dirCen.toLowerCase())
                jQuery("#cenPob span").text(ie.cenPob)

                jQuery("#localidad span").text(ie.localidad)
                jQuery("#distrito span").text(ie.distrito.nombreDistrito)
                jQuery("#provincia span").text(ie.distrito.provincia.nombreProvincia)

                if(ie.distrito.provincia.region.idRegion !='07')
                {   jQuery("#departamento span").text(ie.distrito.provincia.region.nombreRegion)
                }else{
                    jQuery(".fila_departamento").remove();
                }
                jQuery("#codgeo span").text(ie.distrito.idDistrito)
                jQuery("#coddreugel span").text(ie.ugel.idUgel)
                jQuery("#tipprograma span").text(ie.tipoprog==undefined?"": ie.tipoprog.valor)
                jQuery("#turno span").text(ie.turno.valor)
                jQuery("#caracteristica span").text(ie.caracteristica)

                if(ie.telefono!=undefined && ie.telefono !=''){
                    jQuery("#telefono span").text(ie.telefono)
                }else{
                    jQuery("#fila_telefono").remove()
                }

                jQuery("#email span").text(ie.email)
                jQuery("#email span").text(ie.email)


                jQuery("#codMod span").text(ie.codMod)
                jQuery("#codlocal span").text(ie.codlocal)
                jQuery("#anexo span").text(ie.anexo)

                if(ie.estado.idCodigo!=undefined && ie.estado.idCodigo==1){
                    jQuery("#estado span").text(ie.estado.valor)
                }else{
                    jQuery("#estado span").text('Inactivo')
                }

                jQuery("#nlatitud span").text(ie.nlatIE);
                jQuery("#nlongitud span").text(ie.nlongIE);

                jQuery("#nivel").text(ie.nivelModalidad.valor)
                jQuery("#forma").text(ie.forma.valor)
                jQuery("#genero").text(ie.genero.valor)

                jQuery("#areaSig span").text(ie.areaSig.valor)
                jQuery("#gestion").text(ie.gestion)
                jQuery("#gestiondep").text(ie.gestionDependencia.valor)

                if(ie.director !=undefined && ie.director !='') {
                    jQuery("#director span").text(ie.director.toLowerCase())
                }else{
                    jQuery("#fila_director").remove()
                }


                var tbody=jQuery("#resumen tbody")
                var agregarResumen=function(e){
                    var tr=jQuery("<tr/>").appendTo(tbody)
                    jQuery("<td/>").appendTo(tr).text(e.nivelModalidad.valor)
                    if (niv_mod=='A' || niv_mod=='B' || niv_mod=='F'|| niv_mod=='L')
                    {   jQuery("<td/>").appendTo(tr).text(e.totalh)
                        jQuery("<td/>").appendTo(tr).text(e.totalm)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1h)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1m)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2h)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2m)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3h)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3m)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4h)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4m)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5h)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5m)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6h)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6m)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7h)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7m)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8h)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8m)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9h)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9m)
                    }else if(niv_mod=='D'){
                        jQuery("<td/>").appendTo(tr).text(e.totalh)
                        jQuery("<td/>").appendTo(tr).text(e.totalm)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1h)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1m)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2h)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2m)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3h)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3m)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4h)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4m)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5h)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5m)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6h)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6m)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7h)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7m)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8h)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8m)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9h)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9m)
                    }else if(niv_mod=='K'||niv_mod=='M')
                    {
                        jQuery("<td/>").appendTo(tr).text(e.totalh)
                        jQuery("<td/>").appendTo(tr).text(e.totalm)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1h)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1m)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2h)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2m)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3h)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3m)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4h)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4m)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5h)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5m)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6h)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6m)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7h)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7m)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8h)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8m)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9h)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9m)
                        jQuery("<td/>").appendTo(tr).addClass("fila10").text(e.matr10h)
                        jQuery("<td/>").appendTo(tr).addClass("fila10").text(e.matr10m)
                    }else if(niv_mod=='T')
                    {
                        jQuery("<td/>").appendTo(tr).text(e.totalh)
                        jQuery("<td/>").appendTo(tr).text(e.totalm)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1h)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1m)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2h)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2m)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3h)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3m)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4h)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4m)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5h)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5m)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6h)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6m)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7h)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7m)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8h)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8m)

                    }else if (niv_mod=='E')
                    {   jQuery("<td/>").appendTo(tr).text(e.totalh)
                        jQuery("<td/>").appendTo(tr).text(e.totalm)

                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1h)
                        jQuery("<td/>").appendTo(tr).addClass("fila1").text(e.matr1m)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2h)
                        jQuery("<td/>").appendTo(tr).addClass("fila2").text(e.matr2m)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3h)
                        jQuery("<td/>").appendTo(tr).addClass("fila3").text(e.matr3m)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4h)
                        jQuery("<td/>").appendTo(tr).addClass("fila4").text(e.matr4m)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5h)
                        jQuery("<td/>").appendTo(tr).addClass("fila5").text(e.matr5m)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6h)
                        jQuery("<td/>").appendTo(tr).addClass("fila6").text(e.matr6m)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7h)
                        jQuery("<td/>").appendTo(tr).addClass("fila7").text(e.matr7m)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8h)
                        jQuery("<td/>").appendTo(tr).addClass("fila8").text(e.matr8m)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9h)
                        jQuery("<td/>").appendTo(tr).addClass("fila9").text(e.matr9m)
                        jQuery("<td/>").appendTo(tr).addClass("fila10").text(e.matr10h)
                        jQuery("<td/>").appendTo(tr).addClass("fila10").text(e.matr10m)

                    }
                }
                if (ie.estadistica==undefined|| ie.estadistica.imputado=='1'){
                    if(enFecha=="1"){
                        jQuery("#aviso-sn-estadistica").text("Sin datos 2018")
                    }
                    jQuery("#resumen").remove()
                }else{
                    if (jQuery.isArray(ie.estadistica)){
                        jQuery.each(ie.estadistica, function(i,e){
                            if (e.imputado!='1')
                                agregarResumen(e)
                        })
                    }else{
                        agregarResumen(ie.estadistica)
                    }
                }

                jQuery("#alumnoseccion caption").text("Cantidad promedio de Alumnos por Sección, 2018");
                jQuery("#cantalumnoseccion").text("0");

            <c:forEach begin="2004" end="2018" var="anio">

                    jQuery.getJSON(PADRON_REST_URL, {
                        anio:${anio},
                        nivel:ie.nivelModalidad.idCodigo.substr(0,1)
                    }, function (info){

                        if (info.inicial!=undefined){
                            jQuery("#resumen caption").text("Matrícula por edad y sexo, 2018")
                            jQuery("#matricula caption").text("Matrícula por periodo según edad, 2004-2018")
                            jQuery("#docentes caption").text("Docentes, 2004-2018")
                            jQuery("#secciones caption").text("Secciones, 2004-2018")
                            jQuery(".fila9,.fila10").remove()
                            //jQuery("#secciones .fila7,#secciones .fila8").remove()
                            jQuery("#secciones .fila8").remove()
                            
                <c:forEach begin="0" end="7" var="fila">
                    <c:choose>
                        <c:when test="${fila eq 1}">
                                        jQuery(".resum .fila${fila+1} span").text("${fila} Año")
                                        jQuery(".fila${fila+1} .grado span").text("${fila} Año")
                        </c:when>
                        <c:otherwise>
                                        jQuery(".resum .fila${fila+1} span").text("${fila} Años")
                                        jQuery(".fila${fila+1} .grado span").text("${fila} Años")
                        </c:otherwise>
                    </c:choose>

                                    jQuery("#matr-${fila+1}-${anio}").text(info.inicial.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                    jQuery("#secc-${fila+1}-${anio}").text(info.inicial.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>

                                jQuery("#secciones .fila7 .grado span").text("Multiedad")
                                jQuery("#matr-${anio}").text(info.inicial.talumno)
                                jQuery("#secc-${anio}").text(info.inicial.tseccion)
                                jQuery("#doc-${anio}").text(info.inicial.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.inicial.talumno;
                                    totseccion = info.inicial.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.primaria!=undefined){
                                jQuery("#resumen caption").text("Matrícula por grado y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula por periodo según grado, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones por periodo según grado, 2004-2018")

                                jQuery(".fila7,.fila8,.fila9,.fila10").remove()

                <c:forEach begin="1" end="6" var="fila">
                                jQuery(".resum .fila${fila} span").text("${fila}º Grado")
                                jQuery(".fila${fila} .grado span").text("${fila}º Grado")

                                jQuery("#matr-${fila}-${anio}").text(info.primaria.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                jQuery("#secc-${fila}-${anio}").text(info.primaria.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>
                                jQuery("#matr-${anio}").text(info.primaria.talumno)
                                jQuery("#secc-${anio}").text(info.primaria.tseccion)
                                jQuery("#doc-${anio}").text(info.primaria.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.primaria.talumno;
                                    totseccion = info.primaria.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if(info.secundaria!=undefined){
                                jQuery("#resumen caption").text("Matrícula por grado y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula por periodo según grado, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones por periodo según grado, 2004-2018")
                                jQuery(".fila6,.fila7,.fila8,.fila9,.fila10").remove()


                <c:forEach begin="1" end="5" var="fila">
                                jQuery(".resum .fila${fila} span").text("${fila}º Grado")
                                jQuery(".fila${fila} .grado span").text("${fila}º Grado")
                                jQuery("#matr-${fila}-${anio}").text(info.secundaria.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                jQuery("#secc-${fila}-${anio}").text(info.secundaria.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>
                                jQuery("#matr-${anio}").text(info.secundaria.talumno)
                                jQuery("#secc-${anio}").text(info.secundaria.tseccion)
                                jQuery("#doc-${anio}").text(info.secundaria.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.secundaria.talumno;
                                    totseccion = info.secundaria.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.basica_alternativa!=undefined){
                                jQuery("#resumen caption").text("Matrícula de jóvenes y adultos(PEBAJA), por ciclo, grado y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula por periodo según programa y ciclo, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones por periodo según programa y ciclo, 2004-2018")

                                //jQuery(".fila7,.fila8,.fila9,.fila10").remove()
                                jQuery(".fila10").remove()

                                jQuery(".resum .fila1 span").text("1º Inicial")
                                jQuery(".resum .fila2 span").text("2º Inicial")
                                jQuery(".resum .fila3 span").text("1º Inter- medio")
                                jQuery(".resum .fila4 span").text("2º Inter- medio")
                                jQuery(".resum .fila5 span").text("3º Inter- medio")
                                jQuery(".resum .fila6 span").text("1º Avan- zado")
                                jQuery(".resum .fila7 span").text("2º Avan- zado")
                                jQuery(".resum .fila8 span").text("3º Avan- zado")
                                jQuery(".resum .fila9 span").text("4º Avan- zado")

                                jQuery(".fila1 .grado span").text("PEBANA Inicial")
                                jQuery(".fila2 .grado span").text("PEBANA Intermedio")
                                jQuery(".fila3 .grado span").text("PEBANA Avanzado")
                                jQuery(".fila4 .grado span").text("PEBAJA Inicial")
                                jQuery(".fila5 .grado span").text("PEBAJA Intermedio")
                                jQuery(".fila6 .grado span").text("PEBAJA Avanzado")
                                jQuery("#matricula .fila7,#matricula .fila8,#matricula .fila9").remove()
                                jQuery("#secciones .fila7,#secciones .fila8,#secciones .fila9").remove()

                <c:forEach begin="1" end="9" var="fila">
                                jQuery("#matr-${fila}-${anio}").text(info.basica_alternativa.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                jQuery("#secc-${fila}-${anio}").text(info.basica_alternativa.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>
                                jQuery("#matr-${anio}").text(info.basica_alternativa.talumno)
                                jQuery("#secc-${anio}").text(info.basica_alternativa.tseccion)
                                jQuery("#doc-${anio}").text(info.basica_alternativa.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.basica_alternativa.talumno;
                                    totseccion = info.basica_alternativa.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.isp!=undefined){
                                jQuery("#resumen caption").text("Matrícula por ciclo y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula por periodo según ciclo, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones por periodo según ciclo, 2004-2018")


                                addCampoSuperior()
                <c:forEach begin="1" end="10" var="fila">
                                jQuery("#matr-${fila}-${anio}").text(info.isp.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                jQuery("#secc-${fila}-${anio}").text(info.isp.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>
                                jQuery("#matr-${anio}").text(info.isp.talumno)
                                jQuery("#secc-${anio}").text(info.isp.tseccion)
                                jQuery("#doc-${anio}").text(info.isp.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.isp.talumno;
                                    totseccion = info.isp.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.ist!=undefined){
                                jQuery("#resumen caption").text("Matrícula por ciclo y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula por periodo según ciclo, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones por periodo según ciclo, 2004-2018")
                                jQuery(".fila9").remove()
                                jQuery(".fila10").remove()
                                jQuery(".resum .fila1 span").text("I")
                                jQuery(".fila1 .grado span").text("I")
                                jQuery(".resum .fila2 span").text("II")
                                jQuery(".fila2 .grado span").text("II")
                                jQuery(".resum .fila3 span").text("III")
                                jQuery(".fila3 .grado span").text("III")
                                jQuery(".resum .fila4 span").text("IV")
                                jQuery(".fila4 .grado span").text("IV")
                                jQuery(".resum .fila5 span").text("V")
                                jQuery(".fila5 .grado span").text("V")
                                jQuery(".resum .fila6 span").text("VI")
                                jQuery(".fila6 .grado span").text("VI")
                                jQuery(".resum .fila7 span").text("VII")
                                jQuery(".fila7 .grado span").text("VII")
                                jQuery(".resum .fila8 span").text("VIII")
                                jQuery(".fila8 .grado span").text("VIII")

                <c:forEach begin="1" end="10" var="fila">
                                jQuery("#matr-${fila}-${anio}").text(info.ist.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                jQuery("#secc-${fila}-${anio}").text(info.ist.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>
                                jQuery("#matr-${anio}").text(info.ist.talumno)
                                jQuery("#secc-${anio}").text(info.ist.tseccion)
                                jQuery("#doc-${anio}").text(info.ist.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.ist.talumno;
                                    totseccion = info.ist.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.superior_artistica!=undefined){
                                jQuery("#resumen caption").text("Matrícula por ciclo y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula por periodo según ciclo, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones por periodo según ciclo, 2004-2018")
                                addCampoSuperior()
                <c:forEach begin="1" end="10" var="fila">
                                jQuery("#matr-${fila}-${anio}").text(info.superior_artistica.matr<fmt:formatNumber pattern="00" value="${fila}"/>)
                                jQuery("#secc-${fila}-${anio}").text(info.superior_artistica.secc<fmt:formatNumber pattern="00" value="${fila}"/>)
                </c:forEach>
                                jQuery("#matr-${anio}").text(info.superior_artistica.talumno)
                                jQuery("#secc-${anio}").text(info.superior_artistica.tseccion)
                                jQuery("#doc-${anio}").text(info.superior_artistica.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.superior_artistica.talumno;
                                    totseccion = info.superior_artistica.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.educacion_especial!=undefined){
                                jQuery("#resumen caption").text("Matrícula por discapacidad y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones, 2004-2018")

                                jQuery(".resum .fila1 span").text("Intelec tual")
                                jQuery(".resum .fila2 span").text("Audi tiva")
                                jQuery(".resum .fila3 span").text("Baja visión")
                                jQuery(".resum .fila4 span").text("Cegue ra")
                                jQuery(".resum .fila5 span").text("Sordo-ceguera")
                                jQuery(".resum .fila6 span").text("Motora")
                                jQuery(".resum .fila7 span").text("Autismo")
                                jQuery(".resum .fila8 span").text("Múlti ple")
                                jQuery(".resum .fila9 span").text("Alto riesgo")
                                jQuery(".resum .fila10 span").text("Otros")

                                jQuery("#matricula .fila1,#matricula .fila2,#matricula .fila3,#matricula .fila4,#matricula .fila5,#matricula .fila6,#matricula .fila7,#matricula .fila8,#matricula .fila9,#matricula .fila10").remove()
                                jQuery("#secciones .fila1,#secciones .fila2,#secciones .fila3,#secciones .fila4,#secciones .fila5,#secciones .fila6,#secciones .fila7,#secciones .fila8,#secciones .fila9,#secciones .fila10").remove()
                                jQuery("#matr-${anio}").text(info.educacion_especial.talumno)
                                jQuery("#secc-${anio}").text(info.educacion_especial.tseccion)
                                jQuery("#doc-${anio}").text(info.educacion_especial.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.educacion_especial.talumno;
                                    totseccion = info.educacion_especial.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }else if (info.cetpro!=undefined){

                                jQuery("#resumen caption").text("Matrícula por ciclo y sexo, 2018")
                                jQuery("#matricula caption").text("Matrícula, 2004-2018")
                                jQuery("#docentes caption").text("Docentes, 2004-2018")
                                jQuery("#secciones caption").text("Secciones, 2004-2018")

                                jQuery(".fila3,.fila4,.fila5,.fila6,.fila7,.fila8,.fila9,.fila10").remove()
                                jQuery("#matricula .fila1,#matricula .fila2,#secciones .fila1,#secciones .fila2").remove();

                                jQuery(".resum .fila1 span").text("Ciclo Básico")
                                jQuery(".resum .fila2 span").text("Ciclo Medio")

                                jQuery("#matr-${anio}").text(info.cetpro.talumno)
                                jQuery("#secc-${anio}").text(info.cetpro.tseccion)
                                jQuery("#doc-${anio}").text(info.cetpro.tdocente)
                                if(${anio} == 2018){
                                    totalumno = info.cetpro.talumno;
                                    totseccion = info.cetpro.tseccion;
                                    totalAlumnoSeccion(totalumno,totseccion);
                                }
                            }

                        })
            </c:forEach>

                }

            function totalAlumnoSeccion(totalumno,totseccion){
                var promedio = totalumno/totseccion;
                //var rounded = Math.round( promedio * 10 ) / 10;
                var rounded = promedio.toFixed(2);
                jQuery("#cantalumnoseccion").text(rounded);
            }
            function addCampoSuperior()
                {
                    jQuery(".fila0").remove()
                    jQuery(".resum .fila1 span").text("I")
                    jQuery(".fila1 .grado span").text("I")
                    jQuery(".resum .fila2 span").text("II")
                    jQuery(".fila2 .grado span").text("II")
                    jQuery(".resum .fila3 span").text("III")
                    jQuery(".fila3 .grado span").text("III")
                    jQuery(".resum .fila4 span").text("IV")
                    jQuery(".fila4 .grado span").text("IV")
                    jQuery(".resum .fila5 span").text("V")
                    jQuery(".fila5 .grado span").text("V")
                    jQuery(".resum .fila6 span").text("VI")
                    jQuery(".fila6 .grado span").text("VI")
                    jQuery(".resum .fila7 span").text("VII")
                    jQuery(".fila7 .grado span").text("VII")
                    jQuery(".resum .fila8 span").text("VIII")
                    jQuery(".fila8 .grado span").text("VIII")
                    jQuery(".resum .fila9 span").text("IX")
                    jQuery(".fila9 .grado span").text("IX")
                    jQuery(".resum .fila10 span").text("X")
                    jQuery(".fila10 .grado span").text("X")

                }
                function ubicacionmapa(lat,lng,zooming,area,ie) {
                    var coordIE=!(ie.nlatIE==0||ie.nlongIE==0);
                    var coordCP=!(ie.nlatCp==0||ie.nlongCp==0);
                    var avisoCoor;
                    var flagnomark=0;
                    var zoomVar=eval(ie.nzoom)

                    if(coordIE)
                    {   lat=ie.nlatIE;
                        lng=ie.nlongIE;
                        area=ie.areaSig.idCodigo;
                    }else if(coordCP)
                    {   lat=ie.nlatCp;
                        lng=ie.nlongCp;
                        area=ie.areaSig.idCodigo;
                    }else
                    {
                        zoomVar=zooming;
                        flagnomark=1;
                    }

                    var ubicacion = new google.maps.LatLng(lat, lng);

                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: zoomVar,
                        center: ubicacion,
                        mapTypeId: (zoomVar==16)?google.maps.MapTypeId.ROADMAP:google.maps.MapTypeId.HYBRID
                    });
                    if(flagnomark==0){
                     var icono = new google.maps.Marker({
                        map: map,
                        position: ubicacion
                    });
                    }


                    //var urlSig="http://escale.minedu.gob.pe/editor/Editor.aspx?op=2&cod_mod="+ie.codMod+"&anexo="+ie.anexo+"&lt="+lat+"&lg="+lng+"&z="+zooming;
                    var urlSig="http://escale.minedu.gob.pe/editor/";
                    var homeControlDiv = document.createElement('DIV');
                    homeControlDiv.index = 9999;
                    var homeControlDivMenu = document.createElement('DIV');


                    if(!coordIE && coordCP)
                    {
                        if(ie.nlongCp <= -79 && ie.nlongCp >= -81 && ie.nlatCp <=-9 && ie.nlatCp >= -10 )
                        {
                            avisoCoor='COORDENADAS NO DISPONIBLES';
                            var homeControlAviso = new VentanitaBloque(homeControlDiv, map,avisoCoor);
                            homeControlDiv.index = 2;
                            map.controls[google.maps.ControlPosition.LEFT_CENTER].push(homeControlDiv);
                            jQuery("<span/>",{innerHTML:"La ubicación geográfica de la institución educativa no está disponible."}).appendTo("#panEnlace")
                            //jQuery("<span/>",{innerHTML:"¿Conoce bien la zona donde se encuentra la institución educativa? Puede enviarnos su propuesta de ubicación en la Carta Educativa usando nuestro "}).appendTo("#panEnlace")
                            //jQuery("<a/>",{innerHTML:"Editor",href:urlSig,target:"_blank"}).appendTo("#panEnlace")
                            //jQuery("<span/>",{innerHTML:"."}).appendTo("#panEnlace")

                        }else
                        {if(ie.fte_cp=="MED-GPS"){
                                avisoCoor='LAS COORDENADAS CORRESPONDEN AL CENTRO POBLADO';
                            }else{
                                avisoCoor='COORDENADAS NO VERIFICADAS EN CAMPO';
                            }

                            var homeControlMn = new HomeControl(homeControlDivMenu, map,ubicacion);
                            homeControlDivMenu.index=1;
                            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDivMenu);

                            var homeControlAviso = new Ventanita(homeControlDiv, map,avisoCoor);
                            homeControlDiv.index = 2;
                            map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(homeControlDiv);

                            jQuery("<span/>",{innerHTML:"La ubicación geográfica de la institución educativa no está disponible."}).appendTo("#panEnlace")
                            //jQuery("<span/>",{innerHTML:"¿Conoce bien el centro poblado? Puede enviarnos su propuesta de ubicación de la institución educativa usando nuestro "}).appendTo("#panEnlace")
                            //jQuery("<a/>",{innerHTML:"Editor",href:urlSig,target:"_blank"}).appendTo("#panEnlace")
                            //jQuery("<span/>",{innerHTML:"."}).appendTo("#panEnlace")


                        }
                    }else if(!coordIE && !coordCP){
                        avisoCoor='COORDENADAS NO DISPONIBLES';
                        var homeControlAviso = new HomeControl(homeControlDiv, map,ubicacion);
                        homeControlDiv.index = 1;
                        map.controls[google.maps.ControlPosition.LEFT_CENTER].push(homeControlDiv);
                       jQuery("<span/>",{innerHTML:"La ubicación geográfica de la institución educativa no está disponible."}).appendTo("#panEnlace")
                       // jQuery("<span/>",{innerHTML:"¿Conoce bien la zona donde se encuentra la institución educativa? Puede enviarnos su propuesta de ubicación en la Carta Educativa usando nuestro "}).appendTo("#panEnlace")
                       // jQuery("<a/>",{innerHTML:"Editor",href:urlSig,target:"_blank"}).appendTo("#panEnlace")
                       // jQuery("<span/>",{innerHTML:"."}).appendTo("#panEnlace")
                    }else  if(coordIE && !coordCP)
                    {   if(ie.fte_cp!="MED-GPS"){
                            avisoCoor='COORDENADAS NO VERIFICADAS EN CAMPO';
                        }
                        var homeControlMn = new HomeControl(homeControlDivMenu, map,ubicacion);
                        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDivMenu);
                        homeControlDivMenu.index = 1;

                        homeControlAviso = new Ventanita(homeControlDiv, map,avisoCoor);
                        homeControlDiv.index = 2;
                        map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(homeControlDiv);


                    }else{
                        var homeControlMn = new HomeControl(homeControlDivMenu, map,ubicacion);
                        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDivMenu);
                        homeControlDivMenu.index = 1;
                    }




                }

                function Ventanita(controlDiv, map, aviso) {

                    // Set CSS styles for the DIV containing the control
                    // Setting padding to 5 px will offset the control
                    // from the edge of the map
                    controlDiv.style.padding = '5px';

                    // Set CSS for the control border
                    var controlUI = document.createElement('DIV');
                    controlUI.style.backgroundColor = 'white';
                    controlUI.style.borderStyle = 'solid';
                    controlUI.style.borderWidth = '1px';
                    controlUI.style.cursor = 'pointer';
                    controlUI.style.paddingTop = '0px';
                    controlUI.style.textAlign = 'center';
                    //controlUI.title = 'Ventanita de prueba';
                    controlUI.id = 'modalMap';
                    controlDiv.appendChild(controlUI);


                    var controlCloseText = document.createElement('DIV');
                    controlCloseText.style.fontFamily = 'Arial,sans-serif';
                    controlCloseText.style.fontSize = '11px';
                    controlCloseText.style.paddingTop = '0px';
                    controlCloseText.style.paddingLeft = '1px';
                    controlCloseText.style.paddingRight = '1px';
                    controlCloseText .id = 'CloseTxt';

                    //ancho y alto del cajon close
                    controlCloseText.style.width = '270px';
                    controlCloseText.style.height = '20px';


                    // Set CSS for the control interior
                    var controlText = document.createElement('DIV');
                    controlText.style.fontFamily = 'Calibri';
                    controlText.style.fontSize = '11px';
                    controlText.style.paddingTop = '1px';
                    controlText.style.paddingLeft = '1px';
                    controlText.style.paddingRight = '1px';

                    controlText.id = 'modalMapTxt';

                    //ancho y alto del cajon
                    controlText.style.width = '285px';
                    controlText.style.height = '25px';

                    //controlText.style.Top = '70px'

                    controlCloseText.innerHTML = "<a href='#' onclick=cerrarVentanita();>Cerrar</a>";
                    controlText.innerHTML = aviso;
                    controlUI.appendChild(controlCloseText);
                    controlUI.appendChild(controlText);
                }
                function VentanitaBloque(controlDiv, map,aviso) {

                    // Set CSS styles for the DIV containing the control
                    // Setting padding to 5 px will offset the control
                    // from the edge of the map
                    controlDiv.style.padding = '5px';

                    // Set CSS for the control border
                    var controlUI = document.createElement('DIV');
                    controlUI.style.backgroundColor = 'white';
                    controlUI.style.borderStyle = 'solid';
                    controlUI.style.borderWidth = '1px';
                    controlUI.style.cursor = 'pointer';
                    controlUI.style.textAlign = 'center';
                    controlUI.title = 'Ventanita de prueba';
                    controlUI.id = 'modalMapBloque';
                    controlDiv.appendChild(controlUI);



                    // Set CSS for the control interior
                    var controlText = document.createElement('DIV');
                    controlText.style.fontFamily = 'Calibri';
                    //controlText.style.color='#7F7F7F'
                    controlText.style.fontSize = '11px';
                    controlText.style.paddingTop = '80px';
                    controlText.style.paddingLeft = '1px';
                    controlText.style.paddingRight = '1px';
                    controlText.id = 'modalMapBloqueTxt';

                    //ancho y alto del cajon
                    controlText.style.width = '285px';
                    controlText.style.height = '120px';

                    //controlText.style.Top = '70px'

                    controlText.innerHTML = aviso;

                    controlUI.appendChild(controlText);
                    map.disableDefaultUI=true;
                }
                function cerrarVentanita()
                {	jQuery("#modalMap").attr("style","display:block");
                    jQuery("#modalMapTxt").empty();
                    jQuery("#CloseTxt").empty();
                }


        </script>
    </head>


    <body style="text-align:center;background:  #E9E6D7; margin-top: 0 ">
        <center>
            <div  style="margin: 0 0 0 0; width:990px; background: none repeat scroll 0 0  #ffffff;">

                <table border="0" cellpadding="0" style="padding:15px 18px 0 18px" cellspacing="0" width="100%"  >
                    <td align="left" valign="bottom" style="text-align: left; vertical-align: middle " >
                        <img src="http://escale.minedu.gob.pe/image/image_gallery?uuid=58653c42-13a5-4372-bf8c-5684371ea356&groupId=10156&t=1412289483229" align="left"  />
                    </td>
                    <tr>
                        <td colspan="2"  >
                            <table width="100%" border="0" style="margin: 0 0 0 0; vertical-align:middle;color: #ffffff;  background-color: #055FCD ; font-size: 20px; font-family: Arial; height: 40px;">
                                <tr>
                                    <td align="left" style=" padding-left: 10px" >2018</td>
                                    <td align="right" style=" padding-right: 10px; text-transform:  capitalize"  id="TnombreIE"></td>
                                </tr>
                            </table>


                        </td>
                    </tr>
                    <tr style="height:42px; ">

                        <td align="left" valign="bottom" style="text-align: left; vertical-align: middle " >
                            <span style="font-family:Calibri; font-size: 17px;  margin: 0 0 0 10px ;  letter-spacing: 0.07em;   color:  #055FCD ;" >FICHA DE DATOS</span>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2"  >
                            <table width="100%" border="0">
                                <tr>
                                    <td>
                                        <div style="margin: 0px 10px 10px 0px;border: 1px solid black;padding:10px 10px 10px 10px;" >
                                            <div style=" font-family:Arial;font-size: 12px;margin-bottom: 5px;">
                                                <table id="identificacion" border="0" cellpadding="1" cellspacing="0" style="font-family:Arial;font-size: 12px; width: 100%" >
                                                    <tr>
                                                        <td style="font-weight: bold;font-size: 13px;padding: 0px 0px 15px 10px;text-transform:capitalize;" colspan="2" id="nombreIE">

                                                        </td>
                                                        <td class="" ></td>
                                                        <td class="" ><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo" >Código modular</td>
                                                        <td class="dato" id="codMod"><span></span></td>
                                                        <td class="titulo">Dirección</td>
                                                        <td class="dato" id="direccion" style="text-transform:capitalize"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo" >Anexo</td>
                                                        <td class="dato" id="anexo"><span></span></td>
                                                        <td class="titulo">Localidad</td>
                                                        <td class="dato" id="localidad"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Código de local</td>
                                                        <td class="dato" id="codlocal"><span></span></td>
                                                        <td class="titulo">Centro Poblado</td>
                                                        <td class="dato" id="cenPob" style="text-transform:capitalize"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Nivel/Modalidad</td>
                                                        <td class="dato" id="nivel"><span></span></td>
                                                        <td class="titulo">Área Censal (500 Habitantes)</td>
                                                        <td class="dato" id="areaSig"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Forma</td>
                                                        <td class="dato" id="forma"><span></span></td>
                                                        <td class="titulo">Distrito</td>
                                                        <td class="dato" id="distrito"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Género</td>
                                                        <td class="dato" id="genero"><span></span></td>
                                                        <td class="titulo" >Provincia</td>
                                                        <td class="dato" id="provincia"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Tipo de Gestión</td>
                                                        <td class="dato" id="gestion"><span></span></td>
                                                        <td class="titulo">Departamento</td>
                                                        <td class="dato" id="departamento"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Gestión / Dependencia</td>
                                                        <td class="dato" id="gestiondep"><span></span></td>
                                                        <td class="titulo">Código de DRE o UGEL que supervisa el S. E.</td>
                                                        <td class="dato" id="coddreugel"><span></span></td>
                                                    </tr>
                                                    <tr id="fila_director">
                                                        <td class="titulo">Director(a)</td>
                                                        <td class="dato"  id="director" ><span style="text-transform:  capitalize"></span>
                                                        </td>
                                                        <td class="titulo">Nombre de la DRE o UGEL que supervisa el S.E.</td>
                                                        <td class="dato" id="ugel"><span></span></td>
                                                    </tr>
                                                    <tr id="fila_director">
                                                        <td class="titulo">Teléfono</td>
                                                        <td class="dato"  id="telefono" ><span></span>
                                                        </td>
                                                        <td class="titulo">Característica (Censo Educativo 2018)</td>
                                                        <td class="dato" id="caracteristica"><span></span></td>

                                                    </tr>
                                                    <tr id="fila_director">
                                                        <td class="titulo">Correo electrónico</td>
                                                        <td class="dato"  id="email" ><span></span>
                                                        </td>
                                                        <td class="titulo">Latitud</td>
                                                        <td class="dato" id="nlatitud"><span></span></td>
                                                        
                                                    </tr>
                                                    <tr id="fila_director">
                                                        <td class="titulo">Página web</td>
                                                        <td class="dato"  id="paginaweb" ><span></span>
                                                        </td>
                                                        <td class="titulo">Longitud</td>
                                                        <td class="dato" id="nlongitud"><span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulo">Turno</td>
                                                        <td class="dato" id="turno"><span></span></td>
                                                        <td class="titulo" style="border-bottom: 0.5pt solid #D0D2D2"></td>
                                                        <td class="dato" style="border-bottom: 0.5pt solid #ffffff"><span></span></td>
                                                    </tr>
                                                    <tr id="filaDireccion">
                                                        <td class="titulo">Tipo de programa</td>
                                                        <td class="dato" id="tipprograma"><span></span></td>
                                                        <td class="titulo" style="border-bottom: 0.5pt solid #D0D2D2"></td>
                                                        <td class="dato" style="border-bottom: 0.5pt solid #ffffff"><span></span></td>
                                                    </tr>
                                                    <tr id="fila_director">
                                                        <td class="titulo">Estado</td>
                                                        <td class="dato" id="estado"><span></span></td>
                                                        <td class="titulo"></td>
                                                        <td class="dato"><span></span>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                    <td valign="top">
                                        <!--SE ESTA AGREGANDO 25 PX EN LA ALTURA Y EL ANCHO DEL CUADRO-->
                                        
                                        <div style="width:325px;height:340px;border:1px solid #055FCD; padding:10px 10px 10px 10px; margin: 0px 0px 10px 0px; " >
                                            <div id="toc" style="width:115px;display:none;overflow: auto;"></div>
                                            <div id="map" style=" height:340px;">
                                            </div>
                                        </div>
                                        <!--
                                        <div id="panEnlace" style="width:300px;height:50px; color: #055FCD; font-family: 'Calibri'; font-size:12px; text-align: left;   padding: 0px 10px 10px 10px; margin: 10px 25px 10px 0px;" >

                                        </div>
                                        -->
                                        <!--
                                        <div  style="width:300px;height:50px; font-family:'Arial'; font-size: 11px;   letter-spacing: 0.1em;  text-align: left; border: 1px solid black; padding: 10px 10px 10px 10px; margin: 10px 25px 10px 0px;" >
                                            <strong>Acerca de cartografía de Google Maps</strong>  <br/>
                                            El Ministerio de Educación se apoya en estos servicios cartográficos, pero no se hace responsable por errores en sus datos.
                                        </div>-->

                                        <div id="panTermino" style="width:325px;height:auto; font-family:'Arial'; font-size: 11px;   letter-spacing: 0.1em;  text-align: left; border: 1px solid black; padding: 10px 10px 10px 10px; margin: 10px 0px 10px 0px;" >
                                            <strong>Fuentes de información </strong>  <br/>
                                            Padrón de Instituciones Educativas, Censo Escolar 2018, Carta Educativa del Ministerio de Educación-Unidad de Estadística Educativa y cartografía de Google Maps.
                                            <br/><br/>
                                            <!--
                                            <strong>Acerca del uso de estos datos</strong> <br/>

                                            Véase el Acuerdo de Uso de Datos al ingresar a este módulo de consulta.<br/>
                                            La UEE-MED construye y publica una clasificación de área geográfica basada en el criterio utilizado en el Censo de Población y Vivienda del INEI. Su actualización anual obedece a la naturaleza dinámica de la variable y a las fuentes de datos disponibles.
                                            -->
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
<!--                        <td valign="top" align="center" style="width:301px" >
                        </td>-->
                        <td valign="top" colspan="2">
                            <div style="text-align: left;  margin-top: 0px; padding: 10px 0px 0px 5px; background-color: #DDDDDD;font:bold 18px Calibri ; height: 30px;">
                                ESTADÍSTICA
                            </div>

                            <div style="font-family:Arial,Helvetica,sans-serif;font-size: 11px;margin-bottom: 5px;">
                                <div id="aviso-sn-celda" style=" font-family: Arial;  font-style: italic;  font-size:10px; text-align: left; padding: 5px 0px 5px 10px;">
                                    Las celdas en blanco indican que la institución educativa no reportó datos o no funcionó el año respectivo.
                                </div>
                                <div id="aviso-sn-estadistica" style="   font-weight: bold; font-size: 14px; text-align: left; padding: 10px 0px 5px 10px;">
                                </div>
                                <div id="estadisticas">
                                    <img  src="<c:url value='/resources/images/ajax-loader.gif'/>" alt="Cargando..." id="img_cargando" />

                                    <table id="resumen" style="font-family:Arial,Helvetica,sans-serif;font-size: 12px" class="estadistica"  cellpadding="5" cellspacing="1" border="0"   >
                                        <caption style=" color: #333333;  font-weight: bold; text-align: left; padding: 0px 0px 5px 10px;" ></caption>
                                        <thead>
                                            <tr class="resum">
                                                <th rowspan="2">Nivel</th>
                                                <th colspan="2">Total</th>
                                                <c:forEach begin="1" end="10" var="grado">
                                                    <th colspan="2" class="fila${grado} grado"><span></span></th>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>H</th>
                                                <th>M</th>
                                                <c:forEach begin="1" end="10" var="grado">
                                                    <th  class="fila${grado} ">H</th>
                                                    <th  class="fila${grado} ">M</th>
                                                </c:forEach>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>

                                    <table id="matricula" style="font-family:Arial,Helvetica,sans-serif;font-size: 12px" class="estadistica" cellpadding="5" cellspacing="1" >
                                        <caption style="color: #333333;font-weight: bold; text-align: left;padding: 0px 0px 5px 10px;"></caption>
                                        <thead><tr><th>&nbsp;</th>
                                                <c:forEach begin="2004" end="2018" var="anio">
                                                    <th> ${anio}</th>
                                                </c:forEach>
                                            </tr></thead>
                                        <tbody>
                                            <tr class="filaTotal">
                                                <td>Total</td>
                                                <c:forEach begin="2004" end="2018" var="anio">
                                                    <td id="matr-${anio}" class="numero"> </td>
                                                </c:forEach>
                                            </tr>

                                            <c:forEach begin="1" end="10" var="fila">
                                                <tr class="fila${fila}">
                                                    <td class="grado"><span></span></td>
                                                    <c:forEach begin="2004" end="2018" var="anio">
                                                        <td id="matr-${fila}-${anio}" class="numero"> </td>
                                                    </c:forEach>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <table id="docentes" style="font-family:Arial,Helvetica,sans-serif;font-size: 12px" class="estadistica" cellpadding="5" cellspacing="1">
                                        <caption style="color: #333333;font-weight: bold; text-align: left;padding: 0px 0px 5px 10px;"></caption>
                                        <thead><tr><th>&nbsp;</th>
                                                <c:forEach begin="2004" end="2018" var="anio">
                                                    <th> ${anio}</th>
                                                </c:forEach>
                                            </tr></thead>
                                        <tbody>
                                            <tr class="filaTotal">
                                                <td>Total</td>
                                                <c:forEach begin="2004" end="2018" var="anio">
                                                    <td id="doc-${anio}" class="numero"> </td>
                                                </c:forEach>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table id="secciones" style="font-family:Arial,Helvetica,sans-serif;font-size: 12px" class="estadistica" cellpadding="5" cellspacing="1">
                                        <caption style="color: #333333;font-weight: bold; text-align: left;padding: 0px 0px 5px 10px;"></caption>
                                        <thead><tr><th>&nbsp;</th>
                                                <c:forEach begin="2004" end="2018" var="anio">
                                                    <th> ${anio}</th>
                                                </c:forEach>
                                            </tr></thead>
                                        <tbody>
                                            <tr class="filaTotal">
                                                <td>Total</td>
                                                <c:forEach begin="2004" end="2018" var="anio">
                                                    <td id="secc-${anio}" class="numero"> </td>
                                                </c:forEach>
                                            </tr>
                                            <c:forEach begin="1" end="10" var="fila">
                                                <tr class="fila${fila}">
                                                    <td class="grado"><span></span></td>
                                                    <c:forEach begin="2004" end="2018" var="anio">
                                                        <td class="numero" id="secc-${fila}-${anio}"> </td>
                                                    </c:forEach>
                                                </tr>
                                            </c:forEach></tbody>
                                    </table>

                                    <table id="alumnoseccion" style="font-family:Arial,Helvetica,sans-serif;font-size: 12px" class="estadistica" cellpadding="5" cellspacing="1">
                                        <caption title="Cantidad de Alumnos Por Seccion" style="color: #333333;font-weight: bold; text-align: left;"></caption>
                                        <thead><tr><th>&nbsp;</th>
                                                <th>ALUMNOS/SECCIÓN</th>
                                            </tr></thead>
                                        <tbody>
                                            <tr class="filaTotal">
                                                <td>Total</td>
                                                <td style="text-align: center;">
                                                    <label id="cantalumnoseccion" ></label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"  >
                            <div style="width:auto;height:auto; font-family:'Arial'; font-size: 11px;   letter-spacing: 0.1em;  text-align: left; border: 1px solid black; padding: 10px 10px 10px 10px; margin: 10px 25px 10px 0px;" >
                                <strong style="padding-left: 30px">Consideraciones para el uso de datos</strong>
                                <br/>
                                <br/>
                                <ul>
                                    <li style="margin-bottom: 8px">Los datos de ubicación de las instituciones educativas registrados en el Padrón son  proporcionados por las DRE/GRE y UGEL. </li>
                                    <li style="margin-bottom: 8px">La cartografía de límites distritales, corresponde a los  límites censales del INEI, y no indica pertenencia a una jurisdicción político-administrativa determinada.</li>
                                    <li style="margin-bottom: 8px">La clasificación de área geográfica de ESCALE utiliza el criterio utilizado en el Censo de Población y Vivienda del INEI, diferente al utilizado para las asignaciones temporales a docentes que laboran en área rural.</li>

                                </ul><br/>

                                <!--
                                <strong>Acerca del uso de estos datos</strong> <br/>

                                Véase el Acuerdo de Uso de Datos al ingresar a este módulo de consulta.<br/>
                                La UEE-MED construye y publica una clasificación de área geográfica basada en el criterio utilizado en el Censo de Población y Vivienda del INEI. Su actualización anual obedece a la naturaleza dinámica de la variable y a las fuentes de datos disponibles.
                                -->
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="border-top: 1.5px solid #055FCD;">

                </div>
            </div>
        </center>
    </body>
</html>
