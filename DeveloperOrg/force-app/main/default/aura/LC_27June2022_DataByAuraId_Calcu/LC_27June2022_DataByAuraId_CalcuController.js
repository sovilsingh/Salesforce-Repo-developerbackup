({
	add : function(component, event, helper) {
        
        var a1 = component.find("aval").get("v.value");
        var b1 = component.find("bval").get("v.value");
		var r = parseInt(a1) + parseInt(b1);
        
       component.find("result").set("v.value",r);
	},
    
    sub : function(component, event, helper) {
		
          var a1 = component.find("aval").get("v.value");
        var b1 = component.find("bval").get("v.value");
		var r = parseInt(a1) - parseInt(b1);
        
       component.find("result").set("v.value",r);
        
	},
    
    mul : function(component, event, helper) {
		
          var a1 = component.find("aval").get("v.value");
        var b1 = component.find("bval").get("v.value");
		var r = parseInt(a1) * parseInt(b1);
        
       component.find("result").set("v.value",r);
        
	}
})