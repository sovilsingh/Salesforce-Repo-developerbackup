({
	callme : function(component, event, helper) {
        
        var accnt = component.get("v.acc");
        
        var action = component.get("c.callAccounts");
        action.setParams({"acc":accnt});
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") 
            {
                var res = response.getReturnValue();
                Console.log(res);
            }
            
        });
        $A.enqueueAction(action);

         var toastEvent = $A.get("e.force:showToast");
           toastEvent.setParams({
           "type": "success",
           "title": "Success!",
           "message": "The record has been Created successfully."
    });
    toastEvent.fire();
        
	}
})