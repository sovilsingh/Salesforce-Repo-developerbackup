public class CL_INT_1AUG2022_XMLDynamicAccCon {

    public String xmlstring{get;set;}
    
    public void CreateXMl()
    {
        List<Account> accList = [Select Name, Phone, Industry,(Select LastName, FirstName, 
                                Email from contacts where Email != null and FirstName != null ) 
                                from Account where Phone != null and Industry != null Limit 5];
       DOM.Document doc = new DOM.Document();
        
       DOM.XmlNode root = doc.createRootElement('Accounts',null,null);
       for(Account EA:accList)
       {
           DOM.XmlNode branch = root.addChildElement('Account', null, null);
           branch.setAttribute('Name', EA.Name);
           branch.setAttribute('Phone', EA.Phone);
           branch.setAttribute('Industry', EA.Industry);
           if(EA.Contacts.size() > 0)
           {
               DOM.XmlNode branch2 = branch.addChildElement('Contacts', null, null);
               for(Contact EC : EA.Contacts)
               {
                   DOM.XmlNode twig = branch2.addChildElement('Contact', null, null);
                   twig.setAttribute('FirstName', EC.FirstName);
                   twig.setAttribute('LastName', EC.LastName);
                   twig.setAttribute('Email', EC.Email);
               }
           }
       }
        xmlString = doc.toXmlString();    
        
    }
}