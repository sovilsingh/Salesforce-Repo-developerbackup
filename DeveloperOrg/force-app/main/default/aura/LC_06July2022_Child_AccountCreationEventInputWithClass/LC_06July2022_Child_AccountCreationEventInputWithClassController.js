({
	saveme : function(component, event, helper) {
		
        var acc = component.get("v.newAccount");
        var action = component.get("c.InsertAccount");
        action.setParams({"acc":acc});
        action.setCallback(this,function(response){
        var state = response.getState();
        if(state=='SUCCESS')
        {
        var res = response.getReturnValue();
        if(res != 'Failed')
               {
                  var evt = component.getEvent('eventcreate');
                  // evt.setParams({"aid":res});
                   evt.fire();
               }
            else
            {
                alert('Account Creation Failed');
            }
        }
                      
       });
        $A.enqueueAction(action);    
	},
    
    clearme : function(component, event, helper) {
		
        component.set("v.newAccount", "");
	}
})