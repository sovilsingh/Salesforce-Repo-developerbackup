({
	callme : function(component, event, helper) {
		
        alert('Good Morning, this is call me 1');
         $A.enqueueAction(component.get('c.callme2'));
        $A.enqueueAction(component.get('c.callme3'));
	},
    
    callme2 : function(component, event, helper) {
		
        alert('Good Morning, this is call me 2');
	},
    
    callme3 : function(component, event, helper) {
        
        alert('Good Morning, this is call me 3');
	}
})