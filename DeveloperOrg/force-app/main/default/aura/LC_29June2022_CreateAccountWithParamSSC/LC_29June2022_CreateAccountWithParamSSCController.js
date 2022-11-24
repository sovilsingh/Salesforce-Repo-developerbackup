({
	callme : function(component, event, helper) {
        
        //Step 1 : get the SSC method 
		var action = component.get("c.CreateAccount");
        
        //Step 2 : pass the parameter
        action.setParams({"Name":"cognizant", "Rating":"Hot", "phone":"7897897897", "Industry":"Energy"});
        
        //step 3 : Invoke the method
        action.setCallback(this,function(response){    
            //Step  3.1 : get the state    
            var st = response.getState();
            if(st=='SUCCESS')
            {
                //Step 3.2 : Get the Response from SSC Method
               var res = response.getReturnValue();
                alert(res); // Step 3.2 : DO what ever you want with the Response
            }
            else if (st = 'ERROR')
            {
                alert('Please try again');
            }
          
        });
        
        //step 4 : Enqueue/pipeline the Method
        $A.enqueueAction(action);
	}
})