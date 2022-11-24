({
	invoke : function(component, event, helper) {
		
        var params = event.getParam('arguments');
        var nm = params.name;
        var ct = params.city;
        
        component.set("v.empname", nm);
        component.set("v.empcity", ct);
	}
})