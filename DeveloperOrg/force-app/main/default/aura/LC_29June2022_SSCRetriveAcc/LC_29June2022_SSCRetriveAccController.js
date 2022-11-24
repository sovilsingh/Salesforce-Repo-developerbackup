({
	showme : function(component, event, helper) {
        
        //Step 1 -- get the method
        var action = component.get("c.givedata");
		//step 2-- pass params
		//step 3-- Invoke the function -- action.setCallback(this, function(response){});
        action.setCallback(this,function(response){
            
            var state=response.getState();  // 3.1 get the status of invoke
            if(state=='SUCCESS')
            {
                var result =response.getReturnValue(); //3.2 get the result/val/response
                component.set("v.acc", result);
            }
            
        }); 
        
       // step 4 --- Enqueue Action
        $A.enqueueAction(action);
        
	}, 
    
    callme : function(component, event, helper) {
		
	}
})