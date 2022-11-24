public class CL_INT_XML3_DESER_29July2022 
{
     
    public String xmlstring {get;set;}
    
    public String parsedata {get;set;}
    
    public void convertMe()
    {
        DOM.Document doc = new DOM.Document(); // Create Xml Documents
        doc.load(xmlstring);     //Load the Xml String/ recieved string to the doc
        DOM.XmlNode root = doc.getRootElement(); // get Root 
        Parsedata = root.getName();
        List<DOM.XmlNode> childs = root.getChildElements();
        for(DOM.XmlNode each : childs)
        {
            Parsedata =  Parsedata + '\n'+ each.getName();
            Parsedata =  Parsedata + ' : ' + each.getText();
        }
        
        
    }
}