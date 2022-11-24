({
	dateUpdate : function(component, event, helper) {
		
        var today = new Date()
        var dd = today.getDate();
        var mm = today.getMonth();
        var yyyy = today.getFullYear();
        
        if(dd < 10)
        {
            dd = '0' + dd;
        }
        
        if(mm < 10)
        {
            mm = '0' + mm;
        }
        
        var todayFormattedDate = yyyy + '-'+ mm + '-'+ dd;
        if(component.get("v.testDate")!= '' && component.get("v.testDate") < todayFormattedDate )
        {
            component.set("v.dateValidationError", true);
        }
        else
        {
            component.set("v.dateValidationError", false);
        }
	},
    
    submit : function(component, event, helper) {
        
        var isDateError = component.get("v.dateValidationError");
        
        if(isDateError != true)
        {
            alert('Enter Date is Valid');
        }
    }
})