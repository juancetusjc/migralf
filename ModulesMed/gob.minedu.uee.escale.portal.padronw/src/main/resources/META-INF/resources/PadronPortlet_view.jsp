<%--@page import="com.liferay.util.CookieUtil"--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="gob.minedu.uee.escale.portal.padronw.constants.mensajes" var="msg" />
<script type="text/javascript">var context="<c:url value='/'/>"</script>
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.4.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery-ui-1.8.8.custom.min.js'/>"></script>
<link type="text/css" href="<c:url value='/jquery/css/jquery-ui-1.8.8.custom.css'/>" rel="stylesheet" />
<link type="text/css" href="<c:url value='/css/padron.css'/>" rel="stylesheet" />
<SCRIPT type="text/javascript" src="<c:url value='/js/form.js'/>">
</SCRIPT>
<%-- Uncomment below lines to add portlet taglibs to jsp --%>
<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />
<%String id = "5";%>

<%-- String id = CookieUtil.get(request, "ID"); --%>

<form action="" id="buscarIIEEForm"  >
    <input type="hidden" id="key" value='<%= (id == null ? "" : id)%>' />
    <table id="tableForm" style="margin: 0 0 0 0;"  cellpadding="0" cellspacing="5" border="0">
        <tr class="controles" style="font-family:Arial,Helvetica,sans-serif;font-size:11px;" >
            <td class="celeste" id="input-izquierdo"  >
                <div class="input-line">
                    <label for="nombreIE"><fmt:message bundle="${msg}" key="nombreIE"/></label>
                    <input type="text" size="15" id="nombreIE" name="nombreIE" />
                </div>
                <div class="input-line">
                    <label for="cod_mod"><fmt:message bundle="${msg}" key="cod_mod"/></label>
                    <input type="text"  size="7" maxlength="7" id="cod_mod" name="cod_mod" />
                </div>
                <div class="input-line">
                    <label for="codlocal_input"><fmt:message bundle="${msg}" key="codlocal"/></label>
                    <input type="text"  size="6" maxlength="6"  id="codlocal" name="codlocal" />
                </div>
                <div class="input-line">
                    <label for="nombreCP"><fmt:message bundle="${msg}" key="nombreCP"/></label>
                    <input type="text"  size="15"   id="nombreCP" name="nombreCP" />
                </div>
            </td>
            <td >
                <div id="tabs" >
                    <ul>
                        <li><a href="#tabs-1"><fmt:message bundle="${msg}" key="ubigeo.tab"/></a></li>
                        <li><a href="#tabs-2"><fmt:message bundle="${msg}" key="dre_ugel"/></a></li>
                        <%--<li><a href="#tabs-3"><fmt:message bundle="${msg}" key="intervencion.tab"/></a></li>--%>
                    </ul>
                    <div id="tabs-1">
                        <table style="font-family:Arial,Helvetica,sans-serif;font-size:11px;" ><tr>
                                <td height="80px">
                                    <div class="input-line-tab">
                                        <label for="departamento"><fmt:message bundle="${msg}" key="departamento"/></label>
                                        <select id="departamento" name="departamento" style="width: 170px" >
                                        </select>
                                    </div>
                                    <div class="input-line-tab">
                                        <label for="provincia"><fmt:message bundle="${msg}" key="provincia"/></label>
                                        <select id="provincia" name="provincia" style="width: 170px" >
                                        </select>
                                    </div>
                                    <div class="input-line-tab">
                                        <label for="ubigeo"><fmt:message bundle="${msg}" key="distrito"/></label>
                                        <select id="ubigeo" name="ubigeo" style="width: 170px" >
                                        </select>
                                    </div>
                                </td></tr>
                        </table>
                    </div>
                    <div id="tabs-2" >
                        <table style="font-family:Arial,Helvetica,sans-serif;font-size:11px;" ><tr>
                                <td height="80px">

                                    <div class="input-line-tab1">
                                        <label for="dre"><fmt:message bundle="${msg}" key="dre"/></label>
                                        <select id="dre" name="dre" style="width: 150px" >
                                        </select>
                                    </div>
                                    <div class="input-line-tab1">
                                        <label for="ugel"><fmt:message bundle="${msg}" key="ugel"/></label>
                                        <select id="ugel" name="ugel" style="width: 150px" >
                                        </select>
                                    </div>
                                    
                                </td></table>
                    </div>
                   <div id="tabs-3" style="display: none" >
                        <table border="0" width="100%"><tr>
                                <td height="80px"  style="font-family:Arial,Helvetica,sans-serif;font-size:11px" valign="top" >
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr align="center" >
                                            <td >
                                                <div >
                                                    <input type="checkbox" name="intervencion-juntos" id="intervencion-juntosCK" value="S" checked="checked" />
                                                    <label style="padding-left: 0px; padding-right: 10px"    for="intervencion-juntosCK"><fmt:message bundle="${msg}" key="intervencion.juntos" />
                                                    </label>
                                                </div>
                                             </td>
                                             <td>
                                                <div>
                                                    <input type="checkbox"  name="intervencion-vrae" id="intervencion-vraeCK" value="S" checked="checked" />
                                                    <label style="padding-left: 0px; padding-right: 10px" for="intervencion-vraeCK"><fmt:message bundle="${msg}" key="intervencion.vrae" />
                                                    </label>
                                                </div>
                                             </td>
                                             <td>
                                                <div>
                                                    <input type="checkbox"  name="intervencion-crecer"  id="intervencion-crecerCK" value="S" checked="checked" />
                                                    <label style="padding-left: 0px; padding-right: 10px" for="intervencion-crecerCK"><fmt:message bundle="${msg}" key="intervencion.crecer" />
                                                    </label>
                                                </div>        

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="center" >
                                                <div style="margin-top: 20px">
                                                    <input type="checkbox"  name="intervencion-ninguno" id="intervencion-ningunoCK" value="S" checked="checked" />
                                                    <label for="intervencion-ningunoCK"><fmt:message bundle="${msg}" key="intervencion.ninguno" />
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                   </div>
                </div>



            </td>
            <td id="input-derecho" width="45%"  >
                <table class="filtro" border="0" style="font-family:Arial,Helvetica,sans-serif;font-size:11px;" cellpadding="0" cellspacing="0"   >
                    <tr >
                        <td>
                            <table  border="0"  cellpadding="0" cellspacing="0" style="width: 100%;font-size: 11px;height: 35px" >
                                <%--div class="inline">
                                    <input type="checkbox"  id="gestion-all" checked="checked" />
                                    <label for="gestion-all"><fmt:message bundle="${msg}" key="seleccionar.todo" /></label>
                                </div--%>
                                <tr>
                                    <td style="font-weight: bold;padding:0px 5px 5px 5px;" >
                                        <fmt:message bundle="${msg}" key="gestion" />
                                    </td>
                                    <td>
                                        <div class="inline">
                                            <input type="checkbox" name="gestion" value="A1,A2,A3" id="gestionA1"  checked="checked"/>
                                            <label for="gestionA1"><fmt:message bundle="${msg}" key="gestion.A1" /></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="inline">
                                            <input type="checkbox" name="gestion" value="A4" id="gestionA2"  checked="checked"/>
                                            <label for="gestionA2"><fmt:message bundle="${msg}" key="gestion.A2" /></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="inline">
                                            <input type="checkbox" name="gestion" value="B1,B2,B3,B4,B5,B6" id="gestionB1"  checked="checked"/>
                                            <label for="gestionB1"><fmt:message bundle="${msg}" key="gestion.B1" /></label>
                                        </div>
                                    </td>
                                    <%--
                                    <td style="font-weight: bold;padding:0px 5px 5px 20px;border-left:1px solid #B9CDE5 " >
                                        <fmt:message bundle="${msg}" key="area" />
                                    </td>
                                    <td>
                                        <div class="inline">
                                            <input type="checkbox" name="area" value="1" id="areaUrbana"  checked="checked"/>
                                            <label for="areaUrbana"><fmt:message bundle="${msg}" key="area.Urbana" /></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="inline">
                                            <input type="checkbox" name="area" value="2" id="areaRural"  checked="checked"/>
                                            <label for="areaRural"><fmt:message bundle="${msg}" key="area.Rural" /></label>
                                        </div>
                                    </td>--%>

                                    <!--td>
                                        <div class="inline">
                                            <input type="checkbox" name="tipoice" value="21,22,23,24" id="tipoice2"  />
                                            <label for="tipoice"><-fmt:message bundle="{msg}" key="tipoice.2" /></label>
                                        </div>
                                    </td-->
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-top: 1px solid #B9CDE5" valign="top">
                            <table  border="0" class="filtro-sub" cellpadding="0" cellspacing="0" >
                                <%--div class="inline">
                                    <input type="checkbox"  id="gestion-all" checked="checked" />
                                    <label for="gestion-all"><fmt:message bundle="${msg}" key="seleccionar.todo" /></label>
                                </div--%>
                                <tr>
                                    <td>
                                        <div class="etiqueta">
                                            <fmt:message bundle="${msg}" key="nivel" />
                                        </div>
                                        <div class="inline_right">
                                            <input type="checkbox"  id="nivel-all" checked="checked" />
                                            <label for="nivel-all"><fmt:message bundle="${msg}" key="seleccionar.todo" /></label>
                                        </div>
                                    </td>
                                    <td >

                                        <div>
                                            <input type="checkbox" name="nivel" value="A1,A2,A3,A5" id="nivelA"  checked="checked"/>
                                            <label for="nivelA"><fmt:message bundle="${msg}" key="nivel.A" /></label>
                                        </div >
                                        <div >
                                            <input type="checkbox" name="nivel" value="B0" id="nivelB0"  checked="checked"/>
                                            <label for="nivelB0"><fmt:message bundle="${msg}" key="nivel.B0" /></label>
                                        </div>
                                        <div >
                                            <input type="checkbox" name="nivel" value="F0" id="nivelF0"  checked="checked"/>
                                            <label for="nivelF0"><fmt:message bundle="${msg}" key="nivel.F0" /></label>
                                        </div>

                                        <%--div>
                                            <input type="checkbox" name="nivel" value="C0" id="nivelC0"  checked="checked"/>
                                            <label for="nivelC0"><fmt:message bundle="${msg}" key="nivel.C0" /></label>
                                        </div--%>
                                    </td>
                                    <td width="130px" >
                                        <%--div>
                                            <input type="checkbox" name="nivel" value="D0" id="nivelG0"  checked="checked"/>
                                            <label for="nivelG0"><fmt:message bundle="${msg}" key="nivel.G0" /></label>
                                        </div--%>
                                        <div>
                                            <input type="checkbox" name="nivel" value="D0,D1,D2" id="nivelD0"  checked="checked"/>
                                            <label for="nivelD0"><fmt:message bundle="${msg}" key="nivel.D0" /></label>
                                        </div>
                                        <div >
                                            <input type="checkbox" name="nivel" value="E0,E1,E2" id="nivelE0"  checked="checked"/>
                                            <label for="nivelE0"><fmt:message bundle="${msg}" key="nivel.E0" /></label>
                                        </div>
                                        <div >
                                            <input type="checkbox" name="nivel" value="K0" id="nivelK0"  checked="checked"/>
                                            <label for="nivelK0"><fmt:message bundle="${msg}" key="nivel.K0" /></label>
                                        </div>

                                    </td>
                                    <td width="130px" >

                                        <div>
                                            <input type="checkbox" name="nivel" value="M0" id="nivelM0"  checked="checked"/>
                                            <label for="nivelM0"><fmt:message bundle="${msg}" key="nivel.M0" /></label>
                                        </div>
                                        <div>
                                            <input type="checkbox" name="nivel" value="T0" id="nivelT0"  checked="checked"/>
                                            <label for="nivelT0"><fmt:message bundle="${msg}" key="nivel.T0" /></label>
                                        </div>
                                        <div>
                                            <input type="checkbox" name="nivel" value="L0,L1,L2,L3,L4,L5,L6,L7,L8,L9" id="nivelL"  checked="checked"/>
                                            <label for="nivelL"><fmt:message bundle="${msg}" key="nivel.L" /></label>
                                        </div>

                                    </td></tr>
                            </table>
                        </td>
                    </tr>         
                    <tr>
                        <td  style="border-top: 1px solid #B9CDE5;font-size: 11px;"  >
                            <table border="0" style="width: 100%;font-size: 11px;"  cellpadding="0" cellspacing="0" >
                                <tr valign="center">
                                    <%--
                                    <td  width="70" style="margin-top: 5px">
                                        <div class="etiqueta">
                                            <fmt:message bundle="${msg}" key="matIndigena" />
                                        </div>
                                    </td>
                                    <td align="left" style="border-right:1px solid #B9CDE5" >
                                        <div  style="display: block;float: none;padding-left: 0px;margin-top: 5px">
                                            <input type="checkbox" name="matIndigena" value="N" id="matIndigenaNo"  checked="checked"/>
                                            <label for="matIndigenaNo"><fmt:message bundle="${msg}" key="matIndigena.N" /></label>
                                        </div>
                                        <div class="inline">
                                            <input type="checkbox" name="matIndigena" value="S" id="matIndigenaSi"  checked="checked"/>
                                            <label for="matIndigenaSi"><fmt:message bundle="${msg}" key="matIndigena.S" /></label>
                                        </div>
                                        
                                    </td>
                                    --%>
                                    <td >
                                        <div style="padding:5px 5px 5px 5px; float: left; vertical-align: bottom; font-weight: bold;   ">
                                            <fmt:message bundle="${msg}" key="forma" />
                                        </div>
                                    </td>
                                    <td width="100" style="border-right:1px solid #B9CDE5;" >
                                        <div style="display: block;float: none;margin-top: 5px">
                                            <input type="checkbox" name="forma" value="S" id="formaSi"  checked="checked"/>
                                            <label for="formaSi"><fmt:message bundle="${msg}" key="forma.S" /></label>
                                        </div>
                                        <div class="inline">
                                            <input type="checkbox" name="forma" value="N" id="formaNo"  checked="checked" />
                                            <label for="formaNo"><fmt:message bundle="${msg}" key="forma.N" /></label>
                                        </div>

                                    </td >


                                    <td >

                                        <div class="etiqueta">
                                            <fmt:message bundle="${msg}" key="estado" />
                                        </div>
                                    </td>
                                    <td width="70" >
                                        <div style="display: block;float: none;margin-top: 5px">
                                            <input type="checkbox" name="estado" value="1" id="estadoActivo"  checked="checked"/>
                                            <label for="estadoActivo"><fmt:message bundle="${msg}" key="estado.activo" /></label>
                                        </div>
                                        <div class="inline">
                                            <input type="checkbox" name="estado" value="2,3" id="estadoInactivo"  />
                                            <label for="estadoInactivo"><fmt:message bundle="${msg}" key="estado.inactivo" /></label>
                                        </div>
                                    </td>


                                </tr></table>
                        </td>
                    </tr>
                </table>


            </td>
        </tr>
        <tr id="botonera">
            <td colspan="3">
                <img src="<c:url value='/images/ajax-loader.gif'/>" alt="Cargando..." id="img_cargando" />
                <div id="cuenta">

                </div>
                <div id="botones">
                    <button type="button" id="buscar">Buscar</button>
                    <button type="button" id="limpiar">Limpiar</button>
                </div>
                <div id="opciones">
                    <a href="#" id="selector_campos">Agregar / quitar columnas</a>
                    <a href="#" id="exportar_excel"></a>
                </div>
                <div class="clear"></div>
            </td>
        </tr>
        <tr id="filaAvisoBq" >
            <td colspan="3" height="15px"  >

                <div id="avisoBq"  style="font-family:Arial,Helvetica,sans-serif;font-size:11px; color: blue;text-align: CENTER; height:15px;" >
                <marquee behavior="scroll" direction="left"  >
                    <span></span>
                </marquee>
                </div>

            </td>
        </tr>
        <tr valign="top" >
            <td  colspan="3">
                <div class="paginador"></div>
                <div id="listadoCentros">
                    <table id="listadoIIEE" cellpadding="5" cellspacing="1">
                        <thead>
                            <tr>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="paginador"></div>
            </td>

        </tr>
    </table>
</form>

<div id="camposDlg">
    <fmt:message bundle="${msg}" var="campos" key="campos" />
    <% if (id != null) {%>
    <fmt:message bundle="${msg}" var="campos" key="campos.otro" />
    <% }%>
    <c:forTokens delims="," items="${campos}" var="campo">
        <input type="checkbox" name="campo" value="${campo}" id="${campo}" />
        <label for="${campo}"><fmt:message bundle="${msg}" key="campos.${campo}" /></label><br/>
    </c:forTokens>
</div>

<div id="aviso-acceso" style="display: none">
    <h2 style="text-align: center; font-size: 14px;">ACUERDO DE USO DE DATOS</h2>

            <p>Los datos de identificación y localización de la institución educativa tienen como fuente el Padrón de Instituciones Educativas y Programas que gestiona la Unidad de Estadística del Ministerio de Educación con el propósito de ofrecer la base informativa de las operaciones estadísticas aplicadas por el Sector Educación.</p>
            
            <p>Considerando que la mayoría de distritos no se encuentran formalmente delimitados y que no existen bases de datos oficiales de límites político-administrativos, o de centros poblados, los usuarios deben considerar lo siguiente respecto a los datos de localización presentados en ESCALE:</p>
            <ul>
                <li style="margin-bottom: 8px">Los datos de ubicación de las instituciones educativas registrados en el Padrón son  proporcionados por las DRE/GRE y UGEL.</li>
                <li style="margin-bottom: 8px">La cartografía de límites distritales, provinciales y departamentales utilizada como referencia, corresponde a los  límites censales del INEI, por tanto, no indica pertenencia a una jurisdicción político-administrativa determinada.</li>
            
            </ul>
            <p>La Unidad de Estadística construye y publica, para fines estadísticos, una clasificación de área geográfica basada en el criterio utilizado en el Censo de Población y Vivienda del INEI, diferente al utilizado para las asignaciones temporales a docentes que laboran en área rural. Su actualización anual obedece a la naturaleza dinámica de la variable y a las fuentes de datos disponibles.</p>

            <p>Para continuar es preciso que usted exprese su acuerdo con los términos de uso establecidos.</p>

</div>

<div id="consultaDlg">
    <h2 style="text-align: center; font-size: 14px;">Exportar consulta</h2>
    <p>Para descargar los registros de la consulta ingrese su correo electrónico:</p>
    <label for="email_xls">Email:</label>
    <input type="text" name="email_xls" size="30"  id="email_xls" />
    
</div>    

<div id="downloadFile">
    <h2 style="text-align: center; font-size: 14px;">Descargar Padrón</h2>
    <p>Para obtener los registros de la consulta lo puede descargar apartir de la siguiente ruta</p>
    <p>
        <a href="http://escale.minedu.gob.pe/uee/-/document_library_display/GMv7/view/958881" target="_blank">Descargar datos del padrón</a>
    </p>

</div>
