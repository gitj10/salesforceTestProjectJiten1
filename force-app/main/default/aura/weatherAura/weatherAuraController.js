({
    doInit: function(component, event, helper) {
        // Get the weatherData attribute value passed from the parent component
        var weatherData = component.get("v.weatherData");
        component.set("v.weatherData", weatherData);
    }
})