import { LightningElement } from 'lwc';

export default class Lwc_11AUG_example01 extends LightningElement
{
   name = 'Sovil Singh';

   callme(event)
   {
        this.name = 'Sovil Singh is Excellent Salesforce Developer';
   }

   listenName(event)
   {
   
    this.name = event.target.value;

   }

}