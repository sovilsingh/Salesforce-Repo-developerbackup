public class CL_INT_XML2_29July2022 
{
  
    public String xmlstring {get;set;}
    
    public CL_INT_XML2_29July2022()
    {
        
        DOM.Document doc = new DOM.Document();
        DOM.XmlNode root = doc.createRootElement('State', null, null);
        DOM.XmlNode stem = root.addChildElement('Capital',null,null);
        DOm.XmlNode branch = stem.addChildElement('CM',null,null);
        branch.addTextNode('KCR');
        xmlstring = doc.toXmlString();
        
    }
}