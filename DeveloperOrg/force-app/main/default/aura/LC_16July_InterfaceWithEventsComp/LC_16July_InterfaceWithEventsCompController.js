({
	callme : function(component, event, helper) 
    {
		var evt = component.getEvent("InterfaceEvent");
        
        evt.setParams({"empname": "Sovil Singh"});
        evt.fire();
	}, 
    
    show : function(component, event, helper) 
    {
        alert('the event is fired by this components');
    }
})