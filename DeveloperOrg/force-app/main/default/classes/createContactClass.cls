public class createContactClass {
    
   
    List<contact> conList=new List<contact>();
    set<id> accountIdSet=new set<id>();
    public void method1(List<Account> accountList){ // Getting list of account records.
                for(Account obj:accountList){
            accountIdSet.add(obj.id); // Getting id's of account in set.
        }
        
        for(Account obj:[Select id,Name,phone,(Select id,phone from Contacts) from Account where id in:accountIdSet]){ // Querying Account with its related contacts.
            for(contact con:obj.Contacts){ // Getting contact list for a particular account and iterating over it to update phone on all contact records with phone from that particular account.
                con.LastName=obj.Name; // Updating the phone on the contact record from account.
                conList.add(con); // Adding updated contacts in the list to perform DML operation over it.
            }
        }
        if(conList.size() > 0){ // Checking if the list contains an element.
            update conList; // Updating contacts.
        }
       
    }
}