public with sharing class NewsApiHelper {

    @AuraEnabled(cacheable=true)
    public static String getNewsArticles(String searchTerm, String fromDate) {

        String namedCredName = 'NewsAPILegacy';

        searchTerm = searchTerm.replaceAll(' ','');

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:'+ namedCredName+ '?q=' + searchTerm + '&from=' + fromDate + '&sortBy=popularity');
		request.setHeader('X-Api-Key', '{!$Credential.Password}');        
        request.setHeader('Content-Type', 'application/json');
		request.setMethod('GET');
    
        Http http = new Http();
        HttpResponse response = http.send(request);
    
        if (response.getStatusCode() == 200) {
            return response.getBody();
        } else {
            return null;
        }
    }

    @AuraEnabled(cacheable=true)
    public static String getWeatherData(String latitude, String longitude) {

        String namedCredName = 'WeatherAPILeagacy';

        HttpRequest request = new HttpRequest();
        request.setHeader('Content-Type', 'application/json');
		request.setHeader('Key', '{!$Credential.Password}');
        request.setEndpoint('callout:'+ namedCredName + '?q=' + latitude + ',' + longitude);		
        request.setMethod('GET');
    
        Http http = new Http();
        HttpResponse response = http.send(request);
    
        if (response.getStatusCode() == 200) {
            return response.getBody();
        } else {
            return null;
        }
    }
}