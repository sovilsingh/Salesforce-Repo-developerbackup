({
	showme : function(component, event, helper) {
        
        var acc = component.get("v.acc");
        var con = component.get("v.con");
        var cou = component.get("v.cou");
        
        console.log("Account Name Entered "+acc.Name);
        console.log("Account Name Entered "+acc.Phone);
  
        console.log("Contact First Name Entered "+con.FirstName);
        console.log("Contact Second Name Entered "+con.LastName);
        
        console.log("course Name Entered "+cou.Name);
        
	}
})