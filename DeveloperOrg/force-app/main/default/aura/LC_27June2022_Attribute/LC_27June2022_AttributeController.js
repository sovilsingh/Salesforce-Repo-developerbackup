({
	callme : function(component, event, helper) {
		
        alert('Hi this is my first button Invocation');
        component.set("v.empname" , "Sovil Singh");
        component.set("v.age" , 28);
        component.set("v.salary",66000);
	},
    
    clearme : function(component, event, helper) {
		
        alert('Hi this is my second button Invocation');
        component.set("v.empname" , "");
        component.set("v.age" , "");
        component.set("v.salary", "");
        
	}
})