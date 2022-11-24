public class CL_INT_1AUG2022_XMLDynamic {

    public String xmlString {set; get;}
    
    public CL_INT_1AUG2022_XMLDynamic()
    {
        List<Account> acc = [Select id, Name, Phone, Industry From Account where Phone != null and Industry != null Limit 5];
        DOM.Document doc = new DOM.Document();
        DOM.XmlNode root = doc.createRootElement('Account', null, null);
        
        for(Account EA : acc)
        {
            DOM.XmlNode branch = root.addChildElement('Account',null, null );
            branch.setAttribute('Name', EA.Name);
            branch.setAttribute('Phone', EA.Phone);
            branch.setAttribute('Industry', EA.Industry);            
        }  
        xmlString = doc.toXmlString();    
    }
}