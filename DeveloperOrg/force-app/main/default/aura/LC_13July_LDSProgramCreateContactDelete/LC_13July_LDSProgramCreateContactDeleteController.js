({
	deleteme : function(component, event, helper) {
        
        
        component.find("accdel").deleteRecord($A.getCallback(function(response){       
        }));
		
	}
})