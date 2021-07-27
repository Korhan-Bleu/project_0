trigger noGroupDel ON Idol_Group__c (before delete){
    Idol_Group__c I = new Idol_Group__c();
    for(Idol_Group__c I : Trigger.old){
       I.addError(
           'Cannot delete Idol Groups which have already debuted - their stans would kill us.');
   } 
}