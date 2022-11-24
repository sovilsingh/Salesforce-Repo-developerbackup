public class NewAndExisitngController {


public Account account{get; private set;}

public NewAndExisitngController()
{
Id id = Apexpages.currentPage().getParameters().get('id');
account = (id==null)? new Account() : [Select id, name, phone, Industry from Account Where Id=:id];
}

public PageReference Save()
{
try{
upsert(account);
}
catch(System.DMLException e)
{
   ApexPages.addMessages(e);
   return null;
}

PageReference redirectSucess = new ApexPages.StandardController(Account).view();
return redirectSucess;
}
}