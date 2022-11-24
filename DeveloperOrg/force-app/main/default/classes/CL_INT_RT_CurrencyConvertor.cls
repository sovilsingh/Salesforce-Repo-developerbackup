global class CL_INT_RT_CurrencyConvertor implements Database.Batchable<sObject>, Database.AllowsCallouts
{
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        string query = 'Select ID, Amount, INR_Ammount__C from Opportunity';
        return Database.getQueryLocator(query);
    }
    
    
    global void execute(Database.BatchableContext bc, List<Opportunity> scope)
    {
        //String urlendpoint    = 'https://api.apilayer.com/currency_data/live?source=USD&currencies=INR';
        String urlendpoint = 'http://api.currencylayer.com/live?access_key=b3c13e7fdaf2a01f4f68bfdf8065bcf4&source=USD&currencies=INR&format=1';
        HTTP portcl = new HTTP();
        HttpRequest request = new HttpRequest();
        //request.setHeader('apikey', 'jZjkxnNqUDzfNM0oCXd81pxqXFRU101H');
        request.setEndpoint(urlendpoint);
        request.setMethod('GET');
        
        HttpResponse response = portcl.send(request);
        String result = response.getBody();
        
        Decimal amt ;
        System.JSONParser js = JSON.createParser(result);
        
        System.debug(result);
        
        while(js.nextToken()!=null)
        {
            if(js.getText()=='USDINR')
            {
                js.nextToken();
                amt =(decimal)js.getDecimalValue();
                System.debug(amt);
            }
        }
        
        for(opportunity op : Scope)
        {
            if(op.Amount !=null)
            {
            op.INR_Ammount__c = 'RS. '+(amt*op.Amount);
            }
        }
        
        update Scope;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        
    }

}