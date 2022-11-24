trigger UserDemo on User (after update) {
    
        Map<id,User> mymap = Trigger.newMap;
        Map<id,User> mymapold = trigger.oldMap;
       //Id currentUserProfileId = UserInfo.getProfileId();
       // String profileName = [SELECT Name FROM Profile WHERE Id =: currentUserProfileId].Name;
       //List<User> user = [select Id, firstname, lastname, email, title from user where Id IN :userIds];
        List<User> userid  = [SELECT Id,Contact.Id,Name,Email, Title FROM User WHERE Profile.Name = 'Customer Commmunity User'];

        List<contact> cons = new List<contact>();
        for (User usr :userid) {
            if(mymap.containskey(usr.Id) && usr.Title != mymapold.get(usr.Id).title)
               {
            contact c = new contact ();
            c.Title = usr.Title;
            c.Id = usr.ContactId;
            cons.add(c); 
               }
        }
        update cons;
        
}