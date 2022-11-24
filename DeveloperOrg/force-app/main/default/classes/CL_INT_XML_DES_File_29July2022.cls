public class CL_INT_XML_DES_File_29July2022 
{
    public blob xmlfile {get;set;}
    
    public void callme()
    {
        
        List<Account> accounts = new List<Account>();
        String xmlstring = xmlfile.toString();
        xmlfile = null;
        
        DOM.Document doc = new DOM.Document();
        doc.load(xmlstring);
        
        DOM.XmlNode root = doc.getrootElement();
        
        List<DOM.XmlNode> branch = root.getChildElements();
        for(DOM.XmlNode eb : branch)
        {
            Account acc = new Account();
            acc.Name = eb.getAttributeValue('Name', null);
            acc.Phone = eb.getAttributeValue('Mobile', null);
            acc.Industry = eb.getAttributeValue('CompanyType', null);
            accounts.add(acc);
        }
        
        insert accounts;
    }    
}