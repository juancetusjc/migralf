/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//var urlCP = 'http://escale.minedu.gob.pe/MEDGIS/rest/services/CP/CP/MapServer';
//var urlIE = 'http://escale.minedu.gob.pe/MEDGIS/rest/services/IE/IE/MapServer';
var urlCP = 'http://escale.minedu.gob.pe/medgis/rest/services/carto_base/cp/MapServer';
var urlIE = 'http://escale.minedu.gob.pe/medgis/rest/services/carto_base/ie/MapServer';

//var map;
//var ubicacion;
var dynamapIE;
var dynamapCP;
var tocIE = '';
var tocCP = '';

function HomeControl(controlDiv,map,ubicacion) {
    controlDiv.style.padding = '5px';
    // CSS para el control contenedor
    var controlUI = document.createElement('div');
    controlUI.style.backgroundColor = 'white';
    controlUI.style.borderStyle = 'solid';
    controlUI.style.borderWidth = '1px';
    controlUI.style.borderColor = 'gray';
    controlUI.style.cursor = 'pointer';
    controlUI.style.textAlign = 'center';

    controlDiv.appendChild(controlUI);

    // CSS para el control interior
    var controlText = document.createElement('div');
    controlText.style.fontFamily = 'Arial,sans-serif';
    controlText.style.fontSize = '12px';

    controlText.style.paddingTop = '1px';
    controlText.style.paddingBottom = '2px';
    controlText.style.paddingLeft = '5px';
    controlText.style.paddingRight = '5px';
    controlText.innerHTML = '<b>Servicios MED</b>';

    controlUI.appendChild(controlText);

    // CSS para el control Table of Content
    var controlTOC = document.getElementById("toc");
    controlTOC.style.fontFamily = 'Arial,sans-serif';
    controlTOC.style.backgroundColor = 'white';
    controlTOC.style.borderStyle = 'solid';
    controlTOC.style.borderWidth = '1px';
    controlTOC.style.borderColor = 'gray';
    controlTOC.style.fontSize = '10px';
    controlTOC.style.paddingTop = '0px';
    controlTOC.style.paddingBottom = '2px';
    controlTOC.style.paddingLeft = '5px';
    controlTOC.style.paddingRight = '5px';
    controlTOC.style.textAlign='left';


    toc(controlTOC,map);

    controlDiv.appendChild(controlTOC);

    controlDiv.onmouseover = showLayerbox;
    controlDiv.onmouseout = setClose;

    // Setup the click event listeners: simply set the map to
    google.maps.event.addDomListener(controlUI, 'click', function () {
        map.setCenter(ubicacion)
    });

}


function showLayerbox() {
    if (window.timer) clearTimeout(timer);
    $("#toc").fadeIn();
}

function setClose() {
    timer = window.setTimeout(function () {
       $("#toc").fadeOut();
    }, 400);
}

function setVisIE() {
    var service = dynamapIE.getMapService();

    var el = document.getElementById('layerIE' + service.layers[1].id);

    service.layers[1].visible = (el.checked === true);
    service.layers[3].visible = false;
    service.layers[5].visible = false;
    service.layers[7].visible = false;
    service.layers[9].visible = false;

    dynamapIE.refresh();
}

function setVisCP() {
    var service = dynamapCP.getMapService();

    var el = document.getElementById('layerCP' + service.layers[2].id);
    service.layers[2].visible = (el.checked === true);

    service.layers[1].visible = false;
    service.layers[4].visible = false;
    service.layers[5].visible = false;
    service.layers[7].visible = false;
    service.layers[8].visible = false;
    service.layers[10].visible = false;
    service.layers[11].visible = false;
    service.layers[13].visible = false;
    service.layers[14].visible = false;
    service.layers[16].visible = false;
    service.layers[17].visible = false;
    service.layers[19].visible = false;
    service.layers[20].visible = false;
    service.layers[22].visible = false;
    service.layers[23].visible = false;
    service.layers[25].visible = false;
    service.layers[27].visible = false;
    service.layers[29].visible = false;
    service.layers[31].visible = false;
    service.layers[33].visible = false;
    service.layers[35].visible = false;
    service.layers[37].visible = false;

    dynamapCP.refresh();
}

function toc(controlTOC,map) {

        dynamapIE = new gmaps.ags.MapOverlay(urlIE, {
            opacity: 1
        });

        google.maps.event.addListenerOnce(dynamapIE.getMapService(), 'load', function () {
            dynamapIE.setMap(map);
            var serviceIE = dynamapIE.getMapService();

            for (var i = 0; i < serviceIE.layers.length; i++) {

                if (serviceIE.layers[i].name == "IE") {
                    tocIE += '<input type="checkbox" id="layerIE' + serviceIE.layers[i].id + '"';

                    if (serviceIE.layers[i].visible)
                        tocIE += ' checked="checked"';

                    tocIE += ' onclick="setVisIE()">Escuelas<br/>';
                    break;
               }

            }

            controlTOC.innerHTML = tocIE;

        });

        dynamapCP = new gmaps.ags.MapOverlay(urlCP, {
            opacity: 1
        });

        google.maps.event.addListenerOnce(dynamapCP.getMapService(), 'load', function () {
            dynamapCP.setMap(map);
            var serviceCP = dynamapCP.getMapService();

            for (var i = 0; i < serviceCP.layers.length; i++) {

                if (serviceCP.layers[i].name == "CP") {
                    tocCP += '<input type="checkbox" id="layerCP' + serviceCP.layers[i].id + '"';

                    if (serviceCP.layers[i].visible)
                        tocCP += ' checked="checked"';
                    tocCP += ' onclick="setVisCP()">Centros Poblados<br/>';
                    break;
                }
            }

            controlTOC.innerHTML = tocIE+tocCP;

        });

    }