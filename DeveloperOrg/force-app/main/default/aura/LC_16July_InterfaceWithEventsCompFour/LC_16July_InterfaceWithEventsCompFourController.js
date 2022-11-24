({
	show : function(component, event, helper) {
		
         var name = event.getParam('empname');
         component.set("v.en", name);
	}
})