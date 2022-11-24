global class CL_INT_SOAPServiceExample 
{
   webservice static string callme(String name, String phone, String industry)
    {
        DOM.Document doc = new DOM.Document();
        DOM.XmlNode root = doc.createRootElement('Result',null,null);
        try{
            
            Account acc = new Account();
            acc.Name = name;
            acc.Phone = phone;
            acc.Industry = industry;
            insert acc;
            
            DOM.XmlNode status = root.addChildElement('Status', null,null);
            status.addCommentNode('Success');
            DOM.XmlNode idnode = root.addChildElement('Id', null, null);
            idnode.addTextNode(''+acc.Id);
            
        }catch(exception e)
        {
            DOM.XmlNode status = root.addChildElement('Status', null,null);
            status.addCommentNode('Failed');
            DOM.XmlNode idnode = root.addChildElement('Id', null, null);
            idnode.addTextNode(''+ e.getMessage());
        }
        
        String result = doc.toXmlString();
        return result;
    }
}