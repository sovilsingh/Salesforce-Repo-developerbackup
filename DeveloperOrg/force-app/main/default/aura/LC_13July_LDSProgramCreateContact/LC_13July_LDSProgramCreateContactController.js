({
	invokeme : function(component, event, helper) 
    {
		
        component.find("rec").getNewRecord(
        
            "Contact",
            null,
            false,
            $A.getCallback(function(response){
                
                var acc = component.get("v.newcon");
                if(acc==null)
                {
                    alert('Contact Initilization Failed');
                }
                else
                {
                    alert('Contact Initilization Sucess');
                }
                
            })
            
        );
	},
    
    
    saveme : function(component, event, helper) {
		
        component.find("rec").saveRecord(function(response){
            if(response.state=='SUCCESS')
            {
                alert('Contact Created Successful '+response.recordId);;
            }
            else
            {
                 alert('Contact Created Failed with error '+response.error);
            }
            
        });
	}
})