({
	callme : function(component, event, helper) {
		
        var evt = component.getEvent("InterfaceEvent");
        
        evt.setParams({"empname": "Mukesh Singh"});
        evt.fire();
	}
})