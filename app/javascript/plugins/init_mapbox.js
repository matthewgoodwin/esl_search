// app/javascript/plugins/init_mapbox.js
// console.log('hello');
// import mapboxgl from 'mapbox-gl';
// const initMapbox = () => {
//   const mapElement = document.getElementById('map');
//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });
//   }
// };
// export { initMapbox };

//app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    // below added for marker info popups
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    // Create a HTML element for your custom marker
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'cover';
  element.style.backgroundPosition = 'center';
  element.style.backgroundRepeat = 'no-repeat';
  element.style.borderRadius = '50%';
  element.style.width = '25px';
  element.style.height = '25px';
  element.style.border = '1px solid';
  element.style.borderColor = '#D0D0D0';
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      // below added to set popups
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
