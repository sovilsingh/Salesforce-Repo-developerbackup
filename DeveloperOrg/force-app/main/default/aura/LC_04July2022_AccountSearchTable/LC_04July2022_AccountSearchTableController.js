({
    loadMe : function(component, event, helper) {
        
        var clm = [
            
            {label:"Account Name", fieldName:"Name", type:"Text"},
            {label:"Account Phone", fieldName:"Phone", type:"Text"},
            {label:"Account Industry", fieldName:"Industry", type:"Text"},
            {label:"Account Rating", fieldName:"rating", type:"Text"},
            
        ];
            
            component.set("v.columns", clm);
            },
            
            searchME : function(component, event, helper) 
            {
            
            var schtxt = component.get("v.st");
            var action = component.get("c.getAccount");
            action.setParams({"searchtxt":schtxt});
            action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state=='SUCCESS')
            {
            var result = response.getReturnValue();
            component.set("v.acc", result);
            }		
            
            });
            
            $A.enqueueAction(action);
            }
            })