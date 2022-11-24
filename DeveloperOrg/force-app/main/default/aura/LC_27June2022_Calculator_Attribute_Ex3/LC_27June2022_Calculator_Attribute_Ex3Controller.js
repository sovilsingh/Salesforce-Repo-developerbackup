({
	Addme : function(component, event, helper) {
		
         var A = component.get("v.aval");
         var B = component.get("v.bval");
         var result = parseInt(A)+parseInt(B);
         component.set("v.result",result);
        
	},
    
    Subtractme : function(component, event, helper) {
		 var A = component.get("v.aval");
         var B = component.get("v.bval");
         var result = parseInt(A)-parseInt(B);
         component.set("v.result", result);
        
	},
    
    Multiplyme : function(component, event, helper) {
         var A = component.get("v.aval");
         var B = component.get("v.bval");
         var result = parseInt(A)*parseInt(B);
         component.set("v.result", result);		
	}
})