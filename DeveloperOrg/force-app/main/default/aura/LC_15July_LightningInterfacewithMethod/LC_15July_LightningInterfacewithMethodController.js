({
	show : function(component, event, helper) 
    {
		
        component.callme();
	},
    
    invokeme : function(component, event, helper) 
    {
        alert('I was called by component i am interface method');
    }
})