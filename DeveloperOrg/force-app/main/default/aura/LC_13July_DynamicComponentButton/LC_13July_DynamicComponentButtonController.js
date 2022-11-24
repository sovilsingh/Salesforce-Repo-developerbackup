({
	createme : function(component, event, helper) 
    {
		$A.createComponent(
            "lightning:button",
            {
                "label":"Helooo",                                 //Component name
                "variant":"destructive",                          // Atrribute in JSon Format
                "onclick": component.getReference("c.callme")  
            },
            function(newbutton, status, errorMessage)               // function - 3 elements name, status, error
            {
                if(status=="SUCCESS")
                {
                    var body1 = component.get("v.body");
                    body1.push(newbutton);
                    component.set("v.body", body1);
                }
                else (status=="INCOMPLETE" || status=="ERROR")
                {
                    console.log("Error :" +errorMessage)
                }
            }
        );
        
	},
    
    callme: function(component)
    {
        alert('Hello, this function is created in Runtime Hello');
        $A.createComponent(
            "lightning:button",
            {
                "label":"Bye",
                "variant":"destructive",
                "onclick": component.getReference("c.byebye")
            },
            function(newbutton, status, errorMessage)
            {
                if(status=="SUCCESS")
                {
                    var body1 = component.get("v.body");
                    body1.push(newbutton);
                    component.set("v.body", body1);
                }
            }
        );
    },
    
    byebye: function(component)
    {
        alert('Hello, this function is created in byebye');
    }
    
    
})