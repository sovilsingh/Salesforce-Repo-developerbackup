public class CL_INT_JSON2_PSAR_26July {

     public String JsonString{set; get;}
     public String JsonStringSimple {set; get;}
     public Map<String,Object> Result {set; get;}
    
     public void CL_INT_JSON2_PSAR_26July()
    {   
        
        Result = new Map<String,Object>();
        String Name;
        String Pho;
        String Industry;
        String Fax;
        
        
        JsonString = '{"Status":"Success", "Code":100, "Account":[{"Name":"TestAccount", "Phone":"11111", "Rating":"Hot"},{"Name":"TestAccount2", "Phone":"111112", "Rating":"Cold"}]}';
        JsonStringSimple = '{"Name":"Sovil SSingh", "Phone":"123456789", "Industry":"Media", "Fax":"7890"}';
        Account acc = (Account) JSON.deserialize(JsonStringSimple, Account.Class);
        Insert acc;
        
        System.JSONParser jp = JSON.createParser(JsonStringSimple); //Step :- 1  ---- Create Parser
        
        while(jp.nextToken()!=null)                                 //Step :- 2 -------- Check if the parser is success Token is there (Not null)
        {
            if(jp.getText()=='Name')
              {
                  jp.nextToken();
                  Name = jp.getText();
              }
            
            if(jp.getText()=='Phone')
            {
                  jp.nextToken();
                  Pho = jp.getText();
            }
            
             if(jp.getText()=='Industry')
            {
                  jp.nextToken();
                  Industry = jp.getText();
            }
            
            if(jp.getText()=='Fax')
            {
                  jp.nextToken();
                  Fax = jp.getText();
            }
        }
        
        Account a = new Account();
        a.Name = Name;
        a.Phone = Pho;
        a.Fax = Fax;
        a.Industry = Industry;
        Insert a;
    }
        
    }