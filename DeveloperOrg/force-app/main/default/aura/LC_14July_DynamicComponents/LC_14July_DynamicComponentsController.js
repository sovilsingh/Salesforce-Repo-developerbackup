({
	createcomp : function(component, event, helper) 
    {
        $A.createComponents( [
                             [
                                 "lightning:button",
                                 {
                                     "aura:id": "btn1",
                                     "label":"Submit",
                                     "variant":"success"
                                 }
                             ],
                             [
                                 "lightning:input",
                                 {
                                     "aura:id":"inpt1",
                                     "label":"Employee Name",
                                     "type": "Text"
                                 }
                             ],
                             [
                                     "lightning:input",
                                 {
                                     "aura:id":"inpt2",
                                     "label":"Employee Name",
                                     "type": "Text"
                                 }
                             ]], 
                            
                        function(components, status, errorMessage)
                        {
                            if(status=='SUCCESS')
                            {
                                var body = component.get("v.body");
                                components.forEach(function(item){
                                    
                                    body.push(item);
                                });
                                
                                component.set("v.body", body);
                            }
                            else
                            {
                                console.log("Error Creating Components "+errorMessage);
                            }
                        }
                      );
	},
    
    descomp : function(component, event, helper) 
    {
        var des1 = component.find("btn1");
        var des2 = component.find("inpt1");
        var des3 = component.find("inpt2");
        des1.destroy();
        des2.destroy();
        des3.destroy();
    }
})