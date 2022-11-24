({
    showmeaccDetails : function(component, event, helper) {
		
            var action = component.get("c.getData");
            //get the param from event and set Param if you want to pass the Account Id from Event
            // var acc = event.getParam("aid");
            // action.setParam('a':acc);
            
            action.setCallback(this,function(response){
            var State = response.getState();
            if(State=='SUCCESS')
            {
             var result = response.getReturnValue();
             component.set("v.accounts", result);
            }
            
            });
            $A.enqueueAction(action);
            
           // var acc = event.getParam("acc");
           // var accounts = component.get("v.accounts"); // to retain existing data -- pull the existing data from copmonent
           // accounts.push(acc);   //to retain exisitng data -- push the data recieved from event attribute
           // component.set("v.accounts", accounts);
        
	},
    
    
    callme : function(component, event, helper) {
		
        var col = [
            
            {label:'Account Name', fieldName: 'Name', type:'text'},
            {label:'Phone', fieldName: 'Phone', type:'text'},
            {label:'Rating', fieldName: 'Rating', type:'text'},
            {label:'ID', fieldName: 'Id', type:'text'},
            {label:'Industry', fieldName: 'Industry', type:'text'},
      
                  ];
            component.set("v.accountscolums", col);
	}
    
	
})