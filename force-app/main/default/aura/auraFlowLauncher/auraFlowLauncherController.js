({
    launchFlow: function(component, event, helper) {
        var flowApiName = component.get("v.flowApiName");
        var flow = component.find("flowData");
        var inputVariables = [];
        flow.startFlow(flowApiName, inputVariables);
    },
    
    handleFlowStatusChange: function(component, event, helper) {
        if (event.getParam("status") === "FINISHED") {
            // Handle flow completion
            // You can perform any necessary actions here
        }
    }
})