trigger noGroupDel ON Idol_Group__c (before delete){
   if(Idol_Group__c.Debut_Status__c == True){
       Trigger.oldMap.get(Idol_Group__c.Debut_Status__c).addError(
           'Cannot delete Idol Groups which have already debuted - their fans would kill us');
   }
}