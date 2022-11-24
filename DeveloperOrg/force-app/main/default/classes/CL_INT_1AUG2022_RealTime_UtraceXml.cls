public class CL_INT_1AUG2022_RealTime_UtraceXml 
{
    public string ipAddress {get;set;}
    public string body {get;set;}
    public string status {get;set;}
    public string data {get;set;}
    public Map<String,Object> res {get;set;}
    
    public void CallServiceUtrace ()
    {
        res = new Map<String,String>();
        string endpoint = 'http://xml.utrace.de/?query='+ipAddress;  // Step 1 : Create/Identify End Point
        HTTP http = new HTTP();                    // Step 2 : Inatilize Http Protocal
        HttpRequest request = new HttpRequest();     //Step 3 : Create Request Structure 
        request.setEndpoint(endpoint);              // Step 4 : on Request Structure Set Endpoint
        request.setMethod('GET');                //  Step 5 : on Request Structure set Method
        
        HttpResponse response = http.send(request);
        body = response.getBody();
        
        DOM.Document doc = new DOM.Document();
        doc.load(body);
        DOM.XmlNode root = doc.getRootElement();
        LIST<DOM.XmlNode> result = root.getChildElements(); //Result 
        
        DOM.XmlNode parent = result[0];
        
         LIST<DOM.XmlNode> data = parent.getChildElements();
         for(DOM.XmlNode dt : data)
         {
             res.put(dt.getName(),dt.getText());
         }
        
        
    }
    
}