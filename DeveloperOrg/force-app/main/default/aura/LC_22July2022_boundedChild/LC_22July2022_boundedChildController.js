({
	updateChild : function(component, event, helper) {
		component.set("v.childVar", "Updated child Value");
	},
    
    onChildVarChange : function(component, event, helper) {
		
        console.log("Child value has changed");
        console.log("old Value :"+ event.getParam('oldValue'));
        console.log("New Value :"+event.getParam("value"));
	}
})