({
	callme : function(component, event, helper) {
        
        var name = component.get("v.name");
        var phone = component.get("v.phone");
        var industry = component.get("v.industry");
        var rating = component.get("v.rating");
        
        //Step 1 : get the SSC method 
		var action = component.get("c.CreateAccounts");
        
        //Step 2 : pass the parameter
        action.setParams({"Name":name, "Rating":rating, "Phone":phone, "Industry":industry});
        
        //step 3 : Invoke the method
        action.setCallback(this,function(response){    
            //Step  3.1 : get the state    
            var st = response.getState();
            if(st=='SUCCESS')
            {
                //Step 3.2 : Get the Response from SSC Method
                var res = response.getReturnValue();
                //alert(res); // Step 3.2 : DO what ever you want with the Response
                component.set("v.flag", true);
                component.set("v.result", res);
            }
            else if (st = 'ERROR')
            {
                alert('Please try again');
                //Component.set("v.flag", false);
               // Component.set("v.result", res);   
            }
          
        });
        
        //step 4 : Enqueue/pipeline the Method
        $A.enqueueAction(action);
	}
})