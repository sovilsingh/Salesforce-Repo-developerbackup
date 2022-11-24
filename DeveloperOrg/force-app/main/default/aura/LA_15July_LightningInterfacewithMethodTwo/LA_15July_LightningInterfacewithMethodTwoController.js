({
	showme : function(component, event, helper) {
		
        var a = component.get("v.name");
        var b = component.get("v.city");
        
        var child = component.find("three");
        child.callme(a,b);
        
        
	}
})