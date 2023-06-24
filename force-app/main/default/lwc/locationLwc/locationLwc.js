import { LightningElement, track } from 'lwc';

export default class LocationLwc extends LightningElement {
    
  @track latitude;
  @track longitude;
  @track error;
  watchId;


  getLocation() {

    this.latitude=null;
    this.longitude=null;

    if (navigator.geolocation) {

        this.watchId = navigator.geolocation.watchPosition(
            (position) => {
                this.latitude = position.coords.latitude;
                this.longitude = position.coords.longitude;

                // Stop watching for position updates after the first one
                navigator.geolocation.clearWatch(this.watchId);
            },
            (error) => {
                this.errorMessage = error.message;
            }
        );
      } else {
          this.errorMessage = 'Geolocation is not supported by this browser.';
      }
  }

  disconnectedCallback() {
      if (this.watchId) {
          navigator.geolocation.clearWatch(this.watchId);
      }
  }
 

  get mapMarkers() {
    return [
        {
            location: {
                Latitude: this.latitude,
                Longitude: this.longitude
            },
            title: this.locationName,
            description: `Latitude: ${this.latitude}, Longitude: ${this.longitude}`
        }
    ];
}

get mapCenter() {
    return {
        location: {
            Latitude: this.latitude,
            Longitude: this.longitude
        }
    };
}

get mapZoomLevel() {
    return 11;
}

}