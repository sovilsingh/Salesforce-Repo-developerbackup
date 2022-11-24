({
	callme : function(component, event, helper) 
    {
		
        component.set('v.colums',[
           
                {label: 'FirstName', fieldName: 'FirstName', type:'text'},
                {label: 'LastName', fieldName: 'LastName', type:'text'},
                {label: 'Email', fieldName: 'Email', type:'text'},        
                                 ]);
            
            var accid = event.getParam("accId");
            var action = component.get("c.getcontacts");
            action.setParams({"accId": accid});
            action.setCallback(this, function(response){
            var state = response.getState();
            if(state=='SUCCESS')
            {
                var result = response.getReturnValue();
                component.set("v.data", result)
                component.set("v.flag", true);
            }
            
        });
        $A.enqueueAction(action);
            
	}
})