public class CL_INT_XML1_29July_2022 
{

    Public String xmlstring {set;get;}
    
    public CL_INT_XML1_29July_2022()
    {
        DOM.Document doc = new DOM.Document();//Step 1 ------- Create XMl Document
        DOM.XmlNode root = doc.createRootElement('Employee', 'https://www.sfdcclouds.com', 'rc'); //Step --------- give the output create the root
        DOM.XmlNode trunk1 = root.addChildElement('Main', null, null);
        DOM.XmlNode trunk2 = root.addChildElement('Contractor', null, null);
        DOM.XmlNode branch1 = trunk1.addChildElement('Name', null, null);
        DOM.XmlNode branch2 = trunk2.addChildElement('Name', null, null);
        branch1.addTextNode('Rupom'); 
        branch2.addTextNode('Sovil');//add data / frutes
        xmlstring = doc.toXmlString();          //STep ------- Give the Out Put XMl 
    }
    
}