({
	Callme : function(component, event, helper) {
		
        var amt = component.get("v.pri");
        var rate = component.get("v.rate");
        var term = component.get("v.term");
        var res =  (amt*rate*term)/100 
        if(res > 10 )
        {
            component.set("v.flag", true);
        }
        else{
            
            component.set("v.flag", false);
        }
        
         component.set("v.res", res);
	}
})