trigger AccountTeamDemo on AccountTeamMember (After insert) {
    
    System.debug(trigger.new);
    
    Set<ID> accountteamaccountids = new Set<ID>();
    for(AccountTeamMember atm : trigger.new)
    {
          accountteamaccountids.add(atm.AccountId);
    } 
    List<Account> accList = [Select ID, Name From Account Where ID IN : accountteamaccountids ];
    Map<ID,String> IdnameMap = new Map<ID,String>();
    for(Account acc : accList)
    {
        IdnameMap.put(acc.id,acc.Name);
    }
    List<Group> groupList = [Select ID, Name From Group Where Name IN : IdnameMap.values()];
    Set<String> nameSet = new Set<String>();
    for(Group gp : groupList)
    {
      nameSet.add(gp.Name);        
    }
    List<Group> grpList = new List<Group>(); 
    for(Account acc : accList)
    {
        if(!nameSet.contains(acc.Name))
        {
            Group grup = new Group();
            grup.Name = acc.Name;
            grpList.add(grup);
        }
    }
    insert grpList;
    
    for(Group gp : grpList)
    {
        GroupMember grpmember = new GroupMember();
        grpmember.GroupId = gp.Id;
    }
    
   
}