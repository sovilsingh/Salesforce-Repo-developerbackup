({
	Callme : function(component, event, helper) {
        
        var evt = event.getSource(); //Capture/get the source the event where it occured in component
        var aid = evt.getLocalId();  //get the localid of that event
		
        var a1 = component.find("aval").get("v.value");
        var b1 = component.find("bval").get("v.value");
        var r ;
        if(aid=='add')
        {
            r = parseInt(a1) + parseInt(b1);
        }
        else if (aid=='sub')
        {
            r = parseInt(a1)-parseInt(b1);
        }
        else
        {
            r = parseInt(a1)*parseInt(b1);
        }
        
        component.find("result").set("v.value",r);        
	}
})