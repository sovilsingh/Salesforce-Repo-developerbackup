({
	saveme : function(component, event, helper) { 
		
        var newAcc = component.get("v.newAccount");
        
        var evt = component.getEvent("eventcreate");
        
        evt.setParams({"acc": newAcc});
        evt.fire();
        
	},
    
    clearme : function(component, event, helper) {
		
	}
})