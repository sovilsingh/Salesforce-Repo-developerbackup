({
	doaction : function(component, event, helper) {
		
        var inputCmp = component.find("inputCmp");
        var value = inputCmp.get("v.value");
        
        //is Input Numeric
        if(isNaN(value))
        {
            inputCmp.set("v.errors", 
                         [{message:"Input not a Number "+value}]);
        }
        else
        {
              //clear error  
              inputCmp.set("v.errors", null);          
        }
	}
})