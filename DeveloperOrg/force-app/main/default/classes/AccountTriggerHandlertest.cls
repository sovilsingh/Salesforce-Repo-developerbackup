public class AccountTriggerHandlertest {
    
       public static void copyBillingToShipping (List <Account> acclist ) {
       for ( Account acc : acclist ) {
       if(acc.CopyBillingAddToShipping__c ) {
       acc.ShippingCity = acc.BillingCity ;
       acc.ShippingCountry = acc.BillingCountry ;
       acc.ShippingPostalCode = acc.BillingPostalCode ;
       acc.ShippingState = acc.Billingstate ;
       acc.ShippingStreet = acc.Billingstreet;
}
      }
    }
}