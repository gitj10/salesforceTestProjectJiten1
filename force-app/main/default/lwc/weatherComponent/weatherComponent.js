import { LightningElement, track,api } from 'lwc';
import getWeatherData from '@salesforce/apex/NewsApiHelper.getWeatherData';

export default class WeatherComponent extends LightningElement {
  @track location;
  @track weatherData;

  @api latitude;
  @api longitude;

  connectedCallback() {

    if(this.latitude && this.longitude){

        this.getData(this.latitude, this.longitude);
    }
  }

  getData(latitude,longitude){

    getWeatherData({ latitude: latitude, longitude: longitude })
    .then(result => {
        if(result){
          let resObj = JSON.parse(result);
          this.weatherData = resObj;
          this.location = resObj.location.name+', '+ resObj.location.country;
        }
        
    })
    .catch(error => {
        console.error('Error fetching weather data:', error);
    });

  }
}