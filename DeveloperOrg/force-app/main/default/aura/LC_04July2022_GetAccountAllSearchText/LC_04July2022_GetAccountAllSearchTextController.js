({
     searchMe : function(component, event, helper) {
		
         var searchtxt = component.get("v.st");
         
         var action = component.get("c.getAccount");
         
         action.setParams({"searchtxt": searchtxt});
         
         action.setCallback(this,function(response){
             
         var state = response.getState();
             
             if(state =='SUCCESS')
             { 
                 var result = response.getReturnValue();
                 component.set("v.acc", result);
             }
             
         });
         
         $A.enqueueAction(action);
         
	}
})