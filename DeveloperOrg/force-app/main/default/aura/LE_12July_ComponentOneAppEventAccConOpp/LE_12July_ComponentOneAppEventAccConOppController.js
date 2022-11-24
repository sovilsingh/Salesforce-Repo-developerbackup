({
	searchme : function(component, event, helper) {
		
        var name = component.get("v.accName");
        var indus = component.get("v.accIndustry");
        
        var action = component.get("c.search");
        action.setParams({"accname": name, "accind": indus});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state=='SUCCESS')
            {
                var result = response.getReturnValue();
                
                if(result!='Error')
                {
                    var evt = $A.get("e.c:LE_12July_AppEventAccConOpp");
                    console.log(result);
                    evt.setParams({"accId" : result});
                    evt.fire();
                }
            }
            
        });
        $A.enqueueAction(action);
	}
})