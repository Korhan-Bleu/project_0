trigger locationSetUp ON Location__c(after insert, before insert){
    List<Logistic__c> officeSupplies = new List<Logistic__c>();
    Logistic__c supply = new Logistic__c();
    for(Location__c L: Trigger.new){
        if(L.Location_Type__c == 'Office'){
         L.adderror('We are currently not expanding our office locations');
         }
         else{
            supply.name = 'New location ' + L.name;
            supply.Office__c = [SELECT Name FROM Location__c LIMIT 1].Id;
            supply.Nature_of_the_Issue__c = 'A new location has been acquired and needs to be set up with equipment and supplies';
            supply.Date__c = date.today();
            officeSupplies.add(supply); 
         }
    }
    if(officeSupplies.size() > 0){
    insert officeSupplies;
    }
}