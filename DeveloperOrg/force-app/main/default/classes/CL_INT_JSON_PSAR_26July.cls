public class CL_INT_JSON_PSAR_26July {

    public String JsonString{set; get;}
    
    public Map<String,Object> Result {set; get;}
    
    public CL_INT_JSON_PSAR_26July()
    {   
        Result = new Map<String,Object>();         
        JsonString = '{"Name":"Sovil Singh", "Marks":[10,20,30], "City":"Jabalpur"}';
        System.JSONParser jp = JSON.createParser(JsonString);
        
        while(jp.nextToken()!=null)
        {
            Result.put(jp.getText(), jp.getCurrentToken());
        }
    }
    
    
}