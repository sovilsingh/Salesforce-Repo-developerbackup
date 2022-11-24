({
    callme : function(component, event, helper) {
		
        var col = [
            
            {label:'Account Name', fieldName: 'Name', type:'text'},
            {label:'Phone', fieldName: 'Phone', type:'text'},
            {label:'Rating', fieldName: 'Rating', type:'text'},
      
                  ];
            component.set("v.accountscolums", col);
	},
    
	showmeaccDetails : function(component, event, helper) {
		
            var acc = event.getParam("acc");
            var accounts = component.get("v.accounts"); // to retain existing data -- pull the existing data from copmonent
            accounts.push(acc);   //to retain exisitng data -- push the data recieved from event attribute
            component.set("v.accounts", accounts);
        
	}
})