({
	callme : function(component, event, helper) {
		
        var namm = component.get("v.enam")
        var evt = component.getEvent("second");
        evt.setParams({"empname":namm})
        evt.fire();
	}
})