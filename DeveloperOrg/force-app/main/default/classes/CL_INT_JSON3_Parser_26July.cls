public class CL_INT_JSON3_Parser_26July {

    public String demostring;
    
    public void ReadJSONData()
    {
        
        demostring = '{"LastName":"Ashoka The Great", "FirstName":"The Maurya","Customer":{"Name":"Wipro","Phone":"4444"},"Salary":25000}';
        
        System.JSONParser jp = JSON.createParser(demostring);
        
        While(jp.nextToken()!=null)
        {
            
           if(jp.getText() == 'Customer')
           {
            jp.nextToken();
            Account acc = (Account)jp.readValueAs(Account.Class);
            Insert acc;
           }
        
             
           if(jp.getText()== 'Salary')
           {  
               jp.nextToken();
               Decimal sal = (Decimal)jp.getDecimalValue();
               System.debug(sal);   
           }
        
           
             if(jp.getText()== 'FirstName')
           {  
               jp.nextToken();
               String emp = (String)jp.getText();
               System.debug(emp);
           }
        
            
            
            
        }
        
    }
}