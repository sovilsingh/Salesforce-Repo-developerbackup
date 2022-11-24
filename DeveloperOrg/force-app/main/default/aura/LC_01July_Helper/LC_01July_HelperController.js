({
	gm : function(component, event, helper) 
    {
	    component.set("v.msg1", "Good Morning Bhai"); 
        helper.Myhelper(component);
       
	}, 
    
    gn : function(component, event, helper) 
    {
		component.set("v.msg1", "Good Night Bhai");
        helper.Myhelper(component);
     
    
	}
})