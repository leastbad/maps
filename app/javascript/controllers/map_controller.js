import ApplicationController from './application_controller'
import L from 'leaflet'

export default class extends ApplicationController {
  static values = {
    listings: Array,
    latLng: Array,
    zoom: Number,
    token: String
  }

  initialize () {
    this.icon = L.icon({
      iconUrl: '/marker.svg',
      iconSize: [38, 95]
    })
    this.markers = []
    this.zoomElement = document.getElementById('zoom')
    this.coordinatesElement = document.getElementById('coordinates')
  }

  connect () {
    super.connect()

    this.map = L.map(this.element).setView(this.latLngValue, this.zoomValue)

    this.coordinates = this.latLngValue
    this.zoom = this.zoomValue

    L.tileLayer(
      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
      {
        attribution: 'Map data &copy; OpenStreetMap | Imagery &copy; Mapbox',
        maxZoom: 18,
        id: 'mapbox/light-v10',
        accessToken: this.tokenValue
      }
    ).addTo(this.map)

    this.map.doubleClickZoom.disable()
    this.map.on('dblclick', this.createListing)
    this.map.on('zoomend', this.changeZoom)
    this.map.on('moveend', this.changeCoordinates)

    this.listingsValueChanged()
  }

  disconnect () {
    this.map.remove()
  }

  listingsValueChanged () {
    if (this.map == undefined) return // map not initialized yet
    this.markers.forEach(marker => marker.remove())
    this.listingsValue.forEach(listing => {
      this.markers.push(
        L.marker(listing.latLng, { icon: this.icon })
          .addTo(this.map)
          .bindPopup(listing.name)
      )
    })
  }

  latLngValueChanged (latLng) {
    if (this.map == undefined) return // map not initialized yet
    if (this.coordinates == latLng) return // no change
    this.coordinates = latLng
    this.coordinatesElement.textContent = latLng.join(', ')
    this.map.panTo(latLng)
  }

  zoomValueChanged (zoom) {
    if (this.map == undefined) return // map not initialized yet
    this.zoom = zoom
    this.zoomElement.textContent = zoom
    this.map.setZoom(zoom)
  }

  createListing = e =>
    this.stimulate('Listing#create', `${e.latlng.lat},${e.latlng.lng}`)

  changeZoom = () => {
    if (this.zoom == this.map.getZoom()) return // avoid circular Reflex triggers
    this.stimulate('Map#zoom', this.map.getZoom())
  }

  changeCoordinates = () => {
    const center = [
      Math.round(this.map.getCenter().lat * 100) / 100,
      Math.round(this.map.getCenter().lng * 100) / 100
    ]
    if (this.coordinates[0] == center[0] && this.coordinates[1] == center[1])
      return // avoid circular Reflex triggers
    this.coordinates = center
    this.stimulate('Map#move', center)
  }
}
