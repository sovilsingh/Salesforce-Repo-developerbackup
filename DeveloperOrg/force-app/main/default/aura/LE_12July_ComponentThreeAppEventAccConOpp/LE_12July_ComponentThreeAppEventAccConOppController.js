({
	callme : function(component, event, helper) 
    {
		
        component.set('v.colums',[
           
                {label: 'Name', fieldName: 'Name', type:'text'},
                {label: 'StageName', fieldName: 'StageName', type:'text'},
                {label: 'Amount', fieldName: 'Amount', type:'currency'},        
                                 ]);
            
            var accid = event.getParam("accId");
            var action = component.get("c.getopp");
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