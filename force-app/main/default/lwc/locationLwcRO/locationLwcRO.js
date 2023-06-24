import { LightningElement, api } from 'lwc';

export default class LocationLwcRO extends LightningElement {
    
  @api latitude;
  @api longitude;
  @api weatherData
  @api newsDataList;

  weatherObj=[];
  newsDatObj=[];

  connectedCallback() {

    if(this.weatherData){
       
        this.weatherObj = JSON.parse(JSON.stringify(this.weatherData));
        console.log('weatherData='+JSON.stringify(this.weatherObj));
    }

    if(this.newsDataList){ 

        this.newsDatObj = JSON.parse(JSON.stringify(this.newsDataList));

        if(this.newsDatObj.length>10){
    
            this.newsDatObj = this.newsDatObj.slice(0, 9);        
        } 
        console.log('newsDataList='+JSON.stringify(this.newsDatObj)); 
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