({
    getLocation: function(component, event, helper) {
        if (navigator.geolocation) {
            var watchId = navigator.geolocation.watchPosition(
                function(position) {
                    component.set("v.success", true);
                    component.set("v.latitude", position.coords.latitude);
                    component.set("v.longitude", position.coords.longitude);

                    navigator.geolocation.clearWatch(watchId);
                },
                function(error) {
                    component.set("v.errorMessage", error.message);
                }
            );
        } else {
            component.set("v.errorMessage", "Geolocation is not supported by this browser.");
        }
    }
})