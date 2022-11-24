({
	appme : function(component, event, helper) {
		
        var name = event.getParam('empname');
        alert('This is App Data from Parent Data entered in the Child is '+name);
	}
})