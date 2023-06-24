import { LightningElement,api } from 'lwc';

export default class WeatherComponent extends LightningElement {
  
  @api weatherData;
  
  connectedCallback() {

    console.log('weatherComp='+JSON.stringify(this.weatherData)); 
  }
}